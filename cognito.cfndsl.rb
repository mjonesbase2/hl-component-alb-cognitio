CloudFormation do

  Cognito_UserPool(:UserPool) do
    UserPoolName 'test-userpool'
  end  

  Cognito_UserPoolClient(:UserPoolClient) do
    UserPoolId Ref(:UserPool) #Required
    GenerateSecret true
  end

  Cognito_UserPoolDomain(:UserPoolDomain) do
    Domain FnSub("${EnvironmentName}-cf-test-domain") #TODO remove this later
    UserPoolId Ref(:UserPool) #Required
  end

  #TODO Add exports for userpool id etc then import that from the highlander file back into the ALB `actions.rb`
  #cognito, then complete the shared alb-lib function to create cognito-auth for alb with provided deets
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
