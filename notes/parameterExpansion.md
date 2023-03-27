# Bash Shell Parameter Expansion: https://oreil.ly/Af8lw

```bash
${var#pattern}    # Remove shortest (nongreedy) leading pattern
${var##pattern}   # Remove longest (greedy) leading pattern
${var%pattern}    # Remove shortest (nongreedy) trailing pattern
${var%%pattern}   # Remove longest (greedy) trailing pattern
${var/pattern/replacement}    # Replace first +pattern+ with +replacement+
${var//pattern/replacement}   # Replace all +pattern+ with +replacement+
${var^pattern}    # Uppercase first matching optional pattern
${var^^pattern}   # Uppercase all matching optional pattern
${var,pattern}    # Lowercase first matching optional pattern
${var,,pattern}   # Lowercase all matching optional pattern
${var:offset}     # Substring starting at +offset+
${var:offset:length}    # Substring starting at +offset+ for +length+
${var-default}   # Var if set, otherwise +default+
${var:-default}   # Assign +default+ to +var+ if +var+ not ready set or null
${var:?error_message}   # Barf with +error_message+ if +var+ not set
${var:+replaced}  # Expand to +replaced+ if +var+ _is_ set
${#var}       # Length of var
${!var[*]}    # Expand to indexes or keys
${!var[@]}    # Expand to indexes or keys, quoted
${!prefix*}   # Expand to variable names starting with refix+
${!prefix@}   # Expand to variable names starting with refix+, quoted
${var@Q}      # Quoted
${var@E}      # Expanded (better than `eval`!)
${var@P}      # Expanded as prompt
${var@A}      # Assign or declare
${var@a}      # Return attributes
```
