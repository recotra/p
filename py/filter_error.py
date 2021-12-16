import json, operator
import sys

with open(sys.argv[1]) as f_input:
  content = json.load(f_input)
  result = []
  for r in content:
    if r['testResult'] == 'FAILED':
      result.append(r)
      
  with open(sys.argv[2], 'w') as f_output:
    json.dump(result, f_output, indent=4)
    
