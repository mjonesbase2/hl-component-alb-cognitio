CloudFormation do

  Cognito_UserPool(:UserPool) do
    UserPoolName user_pool['name']
  end  

  Cognito_UserPoolGroup(:UserPoolGroup) do
    UserPoolName user_pool['name']
  end  

  Cognito_UserPoolDomain(:UserPoolDomain) do
    GroupName 'default_user_group'
    UserPoolId Ref(:UserPool)
  end

  Cognito_UserPoolClient(:UserPoolClient) do
    UserPoolId Ref(:UserPool)
    ClientName user_pool_client['name']
    GenerateSecret user_pool_client['generate_secret']
    AllowedOAuthFlows user_pool_client['allowed_oauth_flows']
    AllowedOAuthScopes user_pool_client['allowed_ouath_scopes']
    AllowedOAuthFlowsUserPoolClient user_pool_client['allowed_oauth_flows_userpool_client']
    CallbackURLs user_pool_client['call_back_urls']
    DefaultRedirectURI user_pool_client['default_redirect_uri']
    SupportedIdentityProviders user_pool_client['supported_identity_providers']
    RefreshTokenValidity user_pool_client['refresh_token_validity']  3650
    AccessTokenValidity user_pool_client['access_token_validity'] 12
  end
  
  Output(:UserPoolId) {
    Value(FnGetAtt(:UserPool, :Arn))
  }

  Output(:UserPoolClientId) {
    Value(Ref(:UserPoolClient))
  }

  Output(:UserPoolDomainName) {
    Value(Ref(:UserPoolDomain))
  }

end
