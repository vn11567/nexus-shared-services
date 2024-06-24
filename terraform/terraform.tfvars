names = {
  uat : {
    cognitive_account_1_chn = "AI-DEVOPS-GPT4-CHN-OAI"
    cognitive_account_2_swc = "AI-DEVOPS-GPT4-SWC-OAI"
    cognitive_account_3_frc = "AI-DEVOPS-GPT4-FRC-OAI"
    cognitive_account_4_uks = "AI-DEVOPS-GPT4-UKS-OAI"
    cognitive_account_5_eus = "AI-DEVOPS-GPT4-EUS-OAI"
    resource_group          = "backstage-rg"
  }
  prod : {
    cognitive_account_1_chn = "NEXUSCHAT-01-OAI"
    cognitive_account_2_swc = "NEXUSCHAT-02-OAI"
    cognitive_account_3_frc = "NEXUSCHAT-03-OAI"
    cognitive_account_4_uks = "NEXUSCHAT-04-OAI"
    cognitive_account_5_eus = "NEXUSCHAT-05-EUS-OAI"
    resource_group          = "NEXUSCHAT-RG"
  }
}

deployments = {
  chn : [
    {
      name            = "gpt-4"
      model_format    = "OpenAI"
      model_name      = "gpt-4"
      model_version   = "0613"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 20
    },
    {
      name            = "gpt-4-32k"
      model_format    = "OpenAI"
      model_name      = "gpt-4-32k"
      model_version   = "0613"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 60
    },
    {
      name            = "gpt-4-vision-preview"
      model_format    = "OpenAI"
      model_name      = "gpt-4"
      model_version   = "vision-preview"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 30
    },
    {
      name            = "gpt-35"
      model_format    = "OpenAI"
      model_name      = "gpt-35-turbo"
      model_version   = "0613"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 180
    },
    {
      name            = "gpt-35-16k"
      model_format    = "OpenAI"
      model_name      = "gpt-35-turbo-16k"
      model_version   = "0613"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 180
    },
    {
      name            = "text-embedding-ada-002"
      model_format    = "OpenAI"
      model_name      = "text-embedding-ada-002"
      model_version   = "2"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 120
    },
  ],
  swc : [
    {
      name            = "gpt-4"
      model_format    = "OpenAI"
      model_name      = "gpt-4"
      model_version   = "0613"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 20
    },
    {
      name            = "gpt-4-32k"
      model_format    = "OpenAI"
      model_name      = "gpt-4-32k"
      model_version   = "0613"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 60
    },
    {
      name            = "gpt-4-1106-preview"
      model_format    = "OpenAI"
      model_name      = "gpt-4"
      model_version   = "1106-Preview"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 60
    },
    {
      name            = "gpt-35"
      model_format    = "OpenAI"
      model_name      = "gpt-35-turbo"
      model_version   = "0613"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 240
    },
    {
      name            = "gpt-35-16k"
      model_format    = "OpenAI"
      model_name      = "gpt-35-turbo-16k"
      model_version   = "0613"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 240
    },
    {
      name            = "gpt-35-1106"
      model_format    = "OpenAI"
      model_name      = "gpt-35-turbo"
      model_version   = "1106"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 120
    },
    {
      name            = "text-embedding-ada-002"
      model_format    = "OpenAI"
      model_name      = "text-embedding-ada-002"
      model_version   = "2"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 120
    },
    {
      name            = "davinci-002"
      model_format    = "OpenAI"
      model_name      = "davinci-002"
      model_version   = "1"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 120
    },
  ],
  frc : [
    {
      name            = "gpt-4"
      model_format    = "OpenAI"
      model_name      = "gpt-4"
      model_version   = "0613"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 20
    },
    {
      name            = "gpt-4-32k"
      model_format    = "OpenAI"
      model_name      = "gpt-4-32k"
      model_version   = "0613"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 60
    },
    {
      name            = "gpt-4-1106-preview"
      model_format    = "OpenAI"
      model_name      = "gpt-4"
      model_version   = "1106-Preview"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 60
    },
    {
      name            = "gpt-35"
      model_format    = "OpenAI"
      model_name      = "gpt-35-turbo"
      model_version   = "0613"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 240
    },
    {
      name            = "gpt-35-16k"
      model_format    = "OpenAI"
      model_name      = "gpt-35-turbo-16k"
      model_version   = "0613"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 240
    },
    {
      name            = "gpt-35-1106"
      model_format    = "OpenAI"
      model_name      = "gpt-35-turbo"
      model_version   = "1106"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 120
    },
    {
      name            = "text-embedding-ada-002"
      model_format    = "OpenAI"
      model_name      = "text-embedding-ada-002"
      model_version   = "2"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 120
    },
  ],
  uks : [
    {
      name            = "gpt-4-1106-preview"
      model_format    = "OpenAI"
      model_name      = "gpt-4"
      model_version   = "1106-Preview"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 60
    },
  ],
  eus : [
    {
      name            = "gpt-4o"
      model_format    = "OpenAI"
      model_name      = "gpt-4o"
      model_version   = "2024-05-13"
      rai_policy_name = "Microsoft.Default"
      scale_type      = "Standard"
      scale_capacity  = 60
    },
  ]
}
