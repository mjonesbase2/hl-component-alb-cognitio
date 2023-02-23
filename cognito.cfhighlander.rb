CfhighlanderTemplate do
  Name 'cognito'

  ComponentParam 'EnvironmentName', 'dev', isGlobal: true
  ComponentParam 'EnvironmentType', 'development', isGlobal: true
  ComponentParam 'DnsDomain', isGlobal: true

end
