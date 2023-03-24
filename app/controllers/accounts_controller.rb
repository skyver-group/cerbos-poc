class AccountsController < ApplicationController
  def index
    decision = $client.check_resources(
      principal: {
        id: "1",
        roles: ['user']
      },
      resources: [
        {
          resource: {
            kind: 'account',
            id: '1',
            attributes: {
              user_id: "1"
            }
          },
          actions: ['view']
        },
      ]
    )

    p decision.results

    render json: Account.all
  end
end
