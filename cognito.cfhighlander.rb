CfhighlanderTemplate do
  Name 'cognito'

  Parameters do
    ComponentParam 'EnvironmentName', 'dev', isGlobal: true
    ComponentParam 'EnvironmentType', 'development', isGlobal: true
    ComponentParam 'DnsDomain', isGlobal: true
  end
end
