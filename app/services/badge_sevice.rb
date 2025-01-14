class BadgeService
   attr_reader :user

  def initialize(user)
   @user = user
 end

 def give_badges(test)
   Badge.all.each do |badge|
     if badge_rule_met?(badge, test)
       award_badge(badge)
     end
   end
 end

 private

 def badge_rule_met?(badge, test)
   case badge.rule
   when 'all_ruby_tests_passed'
     all_backend_tests_passed?(test)
   when 'first_attempt'
     first_attempt?(test)
   when 'level_tests_passed'
     level_tests_passed?(badge.level, test)
   else
     false
   end
 end

 def all_ruby_tests_passed?(test)
   ruby_tests = Test.where(category: 'Ruby')
   ruby_tests.all? { |t| user.test_passages.where(test: t).successful? }
 end

 def first_attempt?(test)
   user.test_passage(test).attempts == 1
 end

 def level_tests_passed?(level, test)
   level_tests = Test.where(level: level)
   level_tests.all? { |t| user.test_passages.where(test: t).successful? }
 end

 def award_badge(badge)
   UserBadge.create(user: user, badge: badge) unless user.badges.include?(badge)
 end
end
