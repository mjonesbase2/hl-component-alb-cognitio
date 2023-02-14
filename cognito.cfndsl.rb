CloudFormation do

  #TODO find out what reqs there are
  Cognito_UserPool(:UserPool) do
    UserPoolName 'test-userpool'
  end  

  Cognito_UserPoolClient(:UserPoolClient) do
    UserPoolId Ref(:UserPool) #Required
  end

  Cognito_UserPoolDomain(:UserPoolDomain) do
    Domain 'bearse-api-dev' #TODO remove this later
    UserPoolId Ref(:UserPool) #Required
  end

  Cognito_UserPoolIdentityProvider(:IdentityProvider) do
    ProviderName 'Google'
    ProviderType 'Google'
    UserPoolId Ref(:UserPool) #Required
  end

end
