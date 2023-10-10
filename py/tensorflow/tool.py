## Disable tensorflow message, cpp
import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3' 
"""
0 = all messages are logged (default behavior)
1 = INFO messages are not printed
2 = INFO and WARNING messages are not printed
3 = INFO, WARNING, and ERROR messages are not printed
"""
