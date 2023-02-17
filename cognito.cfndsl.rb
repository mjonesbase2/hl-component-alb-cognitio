CloudFormation do

  Cognito_UserPool(:UserPool) do
    UserPoolName FnSub("${EnvironmentName}-cf-userpool")
  end  

  #Check what flows/scopes we want
  Cognito_UserPoolClient(:UserPoolClient) do
    UserPoolId Ref(:UserPool)
    GenerateSecret true
    AllowedOAuthFlows ['code','implicit']
    AllowedOAuthScopes ['email','openid','profile','aws.cognito.signin.user.admin']
    AllowedOAuthFlowsUserPoolClient true
    CallbackURLs Ref(:CallbackURLs)
    DefaultRedirectURI Ref(:DefaultRedirectURI)
  end

  Cognito_UserPoolDomain(:UserPoolDomain) do
    Domain FnSub("${EnvironmentName}-cf-domain")
    UserPoolId Ref(:UserPool)
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
