git clone https://github.com/coreruleset/coreruleset
cat <<EOF >> custom-crs.conf
SecAction "id:900005,\
  phase:1,\
  nolog,\
  pass,\
  ctl:ruleEngine=DetectionOnly,\
  ctl:ruleRemoveById=910000,\
  setvar:tx.paranoia_level=4,\
  setvar:tx.crs_validate_utf8_encoding=1,\
  setvar:tx.arg_name_length=100,\
  setvar:tx.arg_length=400"
EOF
cat coreruleset/crs-setup.conf.example coreruleset/rules/*.conf >> custom-crs.conf