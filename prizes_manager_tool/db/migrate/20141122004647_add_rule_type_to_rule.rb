class AddRuleTypeToRule < ActiveRecord::Migration
  def change
    add_reference :rules, :rule_type, index: true
  end
end
