class AddRuleParametrToBadges < ActiveRecord::Migration[7.1]
  def change
    add_column :badges, :rule_parametr, :string
  end
end
