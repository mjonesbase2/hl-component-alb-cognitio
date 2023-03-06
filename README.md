# alb-cognitio CfHighlander component

### Usage

Creates Cognito UserPool, UserPoolGroup, UserPoolDomain and UserPoolClient. 

### Configuration options

Look at `cognito.config.yaml` for default format of configuration file.

### Parameters

| Name | Use | Default | Global | Type | Allowed Values |
| ---- | --- | ------- | ------ | ---- | -------------- |
| EnvironmentName | Tagging | dev | true | String | 
| EnvironmentType | Tagging | development | true | String | ['development','production']
| DnsDomain | DNS domain to use | | true | String |
| CreateCognitoResources | Set whether to create cognito resources or not | | true | String |  ['true','false']
### Outputs/Exports

| Name | Value | Exported |
| ---- | ----- | -------- |
| UserPoolId | UserPool Id  | true
| UserPoolClientId | UserPoolClient Id | true
| UserPoolDomainName | Domain name of user pool domain| true
| URL |  Application DNS Endpoint | true

## Example Configuration
### Highlander
```
Component name: 'cognito', template: 'git:https://github.com/theonestackhl-component-alb-cognitio#main.snapshot' do
    parameter name: 'DnsDomain', value: root_domain
end 
```