require 'yaml'

describe 'compiled component cognito' do
  
  context 'cftest' do
    it 'compiles test' do
      expect(system("cfhighlander cftest #{@validate} --tests tests/cognito.test.yaml")).to be_truthy
    end      
  end
  
  let(:template) { YAML.load_file("#{File.dirname(__FILE__)}/../out/tests/cognito/cognito.compiled.yaml") }
  
  context "Resource" do

    
    context "UserPool" do
      let(:resource) { template["Resources"]["UserPool"] }

      it "is of type AWS::Cognito::UserPool" do
          expect(resource["Type"]).to eq("AWS::Cognito::UserPool")
      end
      
      it "to have property UserPoolName" do
          expect(resource["Properties"]["UserPoolName"]).to eq("cf_user_pool")
      end
      
    end
    
    context "UserPoolDomain" do
      let(:resource) { template["Resources"]["UserPoolDomain"] }

      it "is of type AWS::Cognito::UserPoolDomain" do
          expect(resource["Type"]).to eq("AWS::Cognito::UserPoolDomain")
      end
      
      it "to have property Domain" do
          expect(resource["Properties"]["Domain"]).to eq("cf-domain")
      end
      
      it "to have property UserPoolId" do
          expect(resource["Properties"]["UserPoolId"]).to eq({"Ref"=>"UserPool"})
      end
      
    end
    
    context "UserPoolClient" do
      let(:resource) { template["Resources"]["UserPoolClient"] }

      it "is of type AWS::Cognito::UserPoolClient" do
          expect(resource["Type"]).to eq("AWS::Cognito::UserPoolClient")
      end
      
      it "to have property UserPoolId" do
          expect(resource["Properties"]["UserPoolId"]).to eq({"Ref"=>"UserPool"})
      end
      
      it "to have property ClientName" do
          expect(resource["Properties"]["ClientName"]).to eq("cf_user_pool_client")
      end
      
      it "to have property GenerateSecret" do
          expect(resource["Properties"]["GenerateSecret"]).to eq(true)
      end
      
      it "to have property AllowedOAuthFlows" do
          expect(resource["Properties"]["AllowedOAuthFlows"]).to eq(["code", "implicit"])
      end
      
      it "to have property AllowedOAuthScopes" do
          expect(resource["Properties"]["AllowedOAuthScopes"]).to eq(["openid", "profile"])
      end
      
      it "to have property AllowedOAuthFlowsUserPoolClient" do
          expect(resource["Properties"]["AllowedOAuthFlowsUserPoolClient"]).to eq(true)
      end
      
      it "to have property CallbackURLs" do
          expect(resource["Properties"]["CallbackURLs"]).to eq(["http://localhost:3000/"])
      end
      
      it "to have property DefaultRedirectURI" do
          expect(resource["Properties"]["DefaultRedirectURI"]).to eq("http://localhost:3000/")
      end
      
    end
    
  end

end