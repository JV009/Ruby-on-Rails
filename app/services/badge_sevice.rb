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

  private

  def badge_rule_met?(badge)
    method_name = "#{badge.rule}?"
    if respond_to?(method_name)
      send(method_name, badge)
    else
      false
    end
  end

  def all_category_of_tests_passed?(badge)
    tests_ids = Test.tests_category(badge.rule_parametr)

    return false if tests_ids.empty?

    passed_tests_ids = @user.test_passages.successful.where(test_id: tests_ids).pluck(:test_id).uniq

    (tests_ids - passed_tests_ids).empty?
  end

  def first_attempt?(badge)
    @user.test_passages.where(test_id: @test_passage.test_id).count == 1 && @test_passage.successful?
  end

  def level_tests_passed?(badge)
    test_level = badge.rule_parametr.to_i
    tests_by_level = @user.tests_level(test_level).pluck(:id)
    passed_tests_by_level = @user.test_passages.successful.where(test_id: tests_by_level).pluck(:test_id).uniq

    (tests_by_level - passed_tests_by_level).empty?
  end

  def award_badge(badge)
    UserBadge.create(user: user, badge: badge) unless user.badges.include?(badge)
  end
end
