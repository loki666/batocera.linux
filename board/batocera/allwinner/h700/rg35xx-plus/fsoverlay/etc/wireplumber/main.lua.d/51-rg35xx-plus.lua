hw0_properties_rule = {
    matches = {
      {
        { "device.name", "equals", "alsa_card.platform-soc_03000000_codec_mach" },
      },
    },
    apply_properties = {
      ["device.form-factor"]     = "internal",
      ["device.nick"]            = "Internal",
      ["api.alsa.use-acp"]       = true,
      ["device.profile-set"]     = "rg35xx-plus.conf",
      ["device.profile"]         = "output:analog-stereo-speaker",
      ["api.acp.auto-profile"]   = false,
      ["api.acp.auto-port"]      = false,
      ["api.alsa.period-size"]   = 2048,
      ["api.alsa.period-num"]    = 2
    },
  }


hw2_properties_rule = {
    matches = {
      {
        { "device.name", "equals", "alsa_card.platform-soc_03000000_ahub1_mach" },
      },
    },
    apply_properties = {
      ["device.description"]     = "HDMI Output",
      ["device.nick"]            = "HDMI",
      ["api.alsa.period-size"]   = 2048,
      ["api.alsa.period-num"]    = 2      
    },
  }
  
  table.insert(alsa_monitor.rules, hw0_properties_rule)
  table.insert(alsa_monitor.rules, hw2_properties_rule)
  