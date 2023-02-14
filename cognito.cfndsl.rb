CloudFormation do

  #TODO find out what reqs there are
  Cognito_UserPool(:UserPool) do
    UserPoolName 'test-userpool'
  end  

  Cognito_UserPoolClient(:UserPoolClient) do
    UserPoolId Ref(:UserPool) #Required
  end

  Cognito_UserPoolDomain(:UserPoolDomain) do
    Domain FnSub("${EnvironmentName}-cf-test-domain") #TODO remove this later
    UserPoolId Ref(:UserPool) #Required
  end

  Cognito_UserPoolIdentityProvider(:IdentityProvider) {
    ProviderName 'Google'
    ProviderType 'Google'
    UserPoolId Ref(:UserPool) #Required
    ProviderDetails ({
      client_id: 'my-google-client-id',
      client_secret: 'my-google-client-secret'
      authorize_scopes: "profile email openid"
    })
  }

end
