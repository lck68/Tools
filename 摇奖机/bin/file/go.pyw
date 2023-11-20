# 导入模块
import random
import matplotlib.pyplot as plt
import matplotlib.patheffects as path_effects

# 读取奖项文件
filePath = "main.ini"
with open(filePath, 'r') as f:
    list= [_.rstrip('\n') for _ in f]
print(list)

# 随机输出列表元素
xx = random.choice(list)
print(xx)

#解决中文乱码问题
plt.rcParams["font.sans-serif"] = ["SimHei"]
#解决负号显示问题
plt.rcParams["axes.unicode_minus"] = False

# 输出艺术字
def plot_artText():
    fig = plt.figure(figsize=(10,2))
    t = fig.text(0.02,0.5,str(xx),fontsize=75,weight=1000,va="center")  # 这里的xx是要输出的字
    t.set_path_effects([
            path_effects.PathPatchEffect(offset=(4,-4),hatch="xxxx",facecolor="grey"),
            path_effects.PathPatchEffect(edgecolor="white",linewidth=1.1,facecolor="black")
     ])
    plt.show()
plot_artText()