print('==============================================')
print('  请输入你想设置的奖项文件的名字:（尽量从简）')
print('==============================================')
name = input()
name = str(name)+'.ini'
name = '../config/'+name
file = open(name,mode='w+')

print('==============================================')
print('  请输入你想设置的奖项：（完成之后关闭窗口即可）')
print('==============================================')

n = 1
while True:
    jx = input('请输入第{}个奖项: '.format(n))
    with open(name,'a') as f:
        f.write(jx)
        f.write('\n')
    n = n+1
