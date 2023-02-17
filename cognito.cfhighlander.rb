CfhighlanderTemplate do
  Name 'cognito'

  Parameters do
    ComponentParam 'EnvironmentName', 'dev'
    ComponentParam 'CallbackURLs',  type: 'CommaDelimitedList'
    ComponentParam 'DefaultRedirectURI', ''
  end

end
