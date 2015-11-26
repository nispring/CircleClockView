# CircleClockView
表盘绘制加圆形进度显示
#1.拖拽CircleClockView文件夹到你的项目
#2.在控制器里面导入CircleClockView.h 头文件
#3.调用代码
    CircleClockView *circleClockView = [[CircleClockView alloc]initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width - 20, [UIScreen mainScreen].bounds.size.width - 20) Weight:56.2 Bmi:26.1 Progress:0.5f];
    [self.view addSubview:circleClockView];
#4.效果如图
![](http://www.mftp.info/20151001/1445916069x2091678061.png)
