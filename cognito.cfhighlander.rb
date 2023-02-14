CfhighlanderTemplate do
  Name 'cognito'
  DependsOn 'lib-alb@feature/cognito_listener_rules'

  Parameters do
    ComponentParam 'EnvironmentName', 'dev'
    ComponentParam 'EnvironmentType', 'development'
  end

end
