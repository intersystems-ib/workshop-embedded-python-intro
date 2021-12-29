# print the members of the Fibonacci series that are less than 10
print('Fibonacci series:')
a, b = 0, 1
while a < 10:
    print(a, end=' ')
    a, b = b, a + b

# import the iris module and show version
import iris
print('\nInterSystems IRIS version:')
irisVersion = iris.cls('%SYSTEM.Version').GetVersion()
print(irisVersion)

