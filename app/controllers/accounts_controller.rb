class AccountsController < ApplicationController
  def index
    @accounts = Account.all
    @decision = $client.check_resources(
      principal: resource_principal,
      resources: resources
    )
    @allowed_resource_ids = @decision.results.filter do |result|
      result.actions['view'] == :EFFECT_ALLOW
    end.collect { |result| result.resource.id }
    @results = Account.where(id: @allowed_resource_ids)

    render json: @results
  end

  private

  def resource_principal
    {
      id: "1",
      roles: ['user']
    }
  end

  def resources
    @resources = @accounts.map do |account|
      {
        resource: {
          kind: Account.name.downcase,
          id: account.id.to_s,
          attributes: {
            user_id: account.user_id.to_s
          },
        },
        actions: ['view']
      }
    end
  end
end
