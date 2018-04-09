import os
from execute import Execute

if __name__ == '__main__':
    print('Booting up CEXEC')
    print('inside main.py before Execute()')
    executor = Execute()
    print('Running CEXEC script')
    exit_code=executor.run()
    print('CEXEC has completed')
    os._exit(exit_code)
