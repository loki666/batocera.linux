rename_hw0_rule = {
    matches = {
      {
        { "device.name", "equals", "alsa_card.platform-soc_03000000_codec_mach" },
      },
    },
    apply_properties = {
      ["device.description"]     = "Built-in Soundcard",
      ["device.nick"]            = "Built-in",
      ["api.alsa.period-size"]   = 2048,
      ["api.alsa.period-num"]    = 3
    },
  }


rename_hw2_rule = {
    matches = {
      {
        { "device.name", "equals", "alsa_card.platform-soc_03000000_ahub1_mach" },
      },
    },
    apply_properties = {
      ["device.description"]     = "HDMI Output",
      ["device.nick"]            = "HDMI",
    },
  }
  
  table.insert(alsa_monitor.rules, rename_hw0_rule)
  table.insert(alsa_monitor.rules, rename_hw2_rule)
  