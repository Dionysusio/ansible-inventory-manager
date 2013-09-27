module Variabable
  extend ActiveSupport::Concern

  included do
    before_save :jsonify_vars
  end

  def jsonify_vars
    unless variables.nil? or variables.empty?
      self.variables = ActiveSupport::JSON.decode(variables).to_json
    end
  end
end