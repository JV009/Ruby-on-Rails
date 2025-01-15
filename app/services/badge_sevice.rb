class BadgeService
   attr_reader :user, :test_passage

  def initialize(user, test_passage)
   @user = user
   @test_passage = test_passage
  end

  def call
    Badge.all.each do |badge|
     award_badge(badge) if badge_rule_met?(badge)
      end
    end
  end

  private

  def badge_rule_met?(badge)
    method_name = "#{badge.rule}?"
    if respond_to?(method_name)
      send(method_name)
    else
      false
    end
  end

  def all_category_of_tests_passed?(badge)
    category = Category.find_by(title: badge.rule_parametr)

    return false unless category

    tests_ids = category.tests.where(status: true).pluck(:id)
    passed_tests_ids = @user.test_passages.where(successful: true).pluck(:test_id).uniq

    (tests_ids - passed_tests_ids).empty?
  end

  def first_attempt?(badge)
    @user.test_passages.where(test_id: @test_passage.test_id).count == 1 && @test_passage.successful?
  end

  def level_tests_passed?(badge)
    test_level = badge.rule_parametr.to_i
    tests_by_level = Test.where(level: test_level, status: true).pluck(:id)
    passed_tests_by_level = @user.test_passages.where(successful: true).pluck(:test_id).uniq

    (tests_by_level - passed_tests_by_level).empty?
  end

  def award_badge(badge)
    UserBadge.create(user: user, badge: badge) unless user.badges.include?(badge)
  end
end
