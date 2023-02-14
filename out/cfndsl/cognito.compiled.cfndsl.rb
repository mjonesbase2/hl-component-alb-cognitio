
    load('/Library/Ruby/Gems/2.6.0/gems/cfhighlander-0.12.2/lib/../cfndsl_ext/iam_helper.rb')

    load('/Library/Ruby/Gems/2.6.0/gems/cfhighlander-0.12.2/lib/../cfndsl_ext/lambda_helper.rb')

    load('/Users/tarunmenon/.cfhighlander/components/lib-alb/feature/cognito_listener_rules/ext/cfndsl/cognito.rb')

CloudFormation do
  # cfhl meta: cfndsl_version=1.4.0
  loadbalancer_scheme = external_parameters.fetch(:loadbalancer_scheme, nil)
  dns_format = external_parameters.fetch(:dns_format, nil)
  component_version = external_parameters.fetch(:component_version, nil)
  component_name = external_parameters.fetch(:component_name, nil)
  template_name = external_parameters.fetch(:template_name, nil)
  template_version = external_parameters.fetch(:template_version, nil)
  template_dir = external_parameters.fetch(:template_dir, nil)
  description = external_parameters.fetch(:description, nil)

  # render subcomponents



	  #TODO find out what reqs there are
	  Cognito_UserPool(:UserPool) do
	    UserPoolName 'test-userpool'
	  end  
	
	  Cognito_UserPoolClient(:UserPoolClient) do
	    UserPoolId Ref(:UserPool) #Required
	  end
	
	  Cognito_UserPoolDomain(:UserPoolDomain) do
	    Domain FnSub("${EnvironmentName}-testcognito-domain") #TODO remove this later
	    UserPoolId Ref(:UserPool) #Required
	  end
	
	  Cognito_UserPoolIdentityProvider(:IdentityProvider) {
	    ProviderName 'Google'
	    ProviderType 'Google'
	    UserPoolId Ref(:UserPool) #Required
	    ProviderDetails ({
	      client_id: 'my-google-client-id',
	      client_secret: 'my-google-client-secret'
	    })
	  }
	
	



    # cfhighlander generated lambda functions
    

    # cfhighlander generated parameters

    Parameter('EnvironmentName') do
      Type 'String'
      Default 'dev'
      NoEcho false
    end

    Parameter('EnvironmentType') do
      Type 'String'
      Default 'development'
      NoEcho false
    end



    Description 'cognito@latest - vlatest'

    Output('CfTemplateUrl') {
        Value("/cognito.compiled.yaml")
    }
    Output('CfTemplateVersion') {
        Value("latest")
    }
end
