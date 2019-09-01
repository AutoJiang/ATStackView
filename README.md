# ATStackView
用法参考: [ATStackView](https://www.jianshu.com/p/c53c37b381bf)
对于布局，你是否还在为计算View的Frame而烦恼，或者你是否还在为约束代码冗杂而头疼。快来体验一下ATStackView所带来的快感吧。

首先，我们在对控件A和B布局的时候，如果需求要求B跟在A后面，且A，B居中对齐，那么使用约束布局B的时候，肯定需要依赖A的某条边。而且他们对齐的时候，对两控件使用了相同的一条约束。一旦后期产品突然要求把A改放在B后面。那么这时候，使用约束的小伙伴们需要同时对A，B两个控件的约束进行修改。而使用UIStackView的小伙伴，只需要改变A，B入栈的顺序，即可轻松完成控件的调整。并且UIStackView能够保证控件们在某条准线上对齐，因此能减少约束的使用。

ATStackView 是基于UIStackView的封装。使得开发者更加便利的创建和使用一个UIStackView，如果整个页面全部使用UIStackView布局，必将会创建大量的UIStackView，而默认的UIStackView往往满足不了需求，需要调整属性，增加了额外的代码量（XIB使用者除外）。因此基于ATStackView的使用，开发者可以节省大量的代码来进行布局。

同时ATStackView还扩展了一些属性和方法，使得StackView更加的灵活，更加强大。


> github链接: [https://github.com/AutoJiang/ATStackView](https://github.com/AutoJiang/ATStackView)

pod install
>pod 'ATStackView'

使用方法：
---
1. 导入头文件
---
``` 
#import "UIView+ATStack.h" 
```

2. 快速创建一个横向布局或者纵向布局的栈（ATVerStackView 或 ATHorStackView）。
---
默认创建一个和 self.view 等大，纵向排列的栈。
并添加至 self.view 上面(注: 内部已经将[self.view addSubview: stack]，外部无需重复添加)。
```
ATVerStackView *stack = [self.view addStackVer];
```
创建一个纵向排列的栈,添加至 self.view 上。距离顶部100，左边0，底部100，右边0。

```
ATVerStackView *stack = [self.view addStackVerWithInset:UIEdgeInsetsMake(100, 0, 100, 0)];
```

直接创建一个纵向排列的栈。
```
ATVerStackView *stack = [ATVerStackView getStackVer];
```
3. 添加元素（添加控件，或者其他栈）
---
这种方式直接添加view，view内部必须有高度上面的约束。
```
[stack addArrangedSubview:view];
```
推荐使用以下方式：（height 代表的约束height = 30 ,  isFill = true代表宽度和stack一样宽，isFill = false代表控件使用自适应的宽）
```
UIView *view1 = [UIView new];
view1.backgroundColor = [UIColor whiteColor];
[stack addArrangedSubview:view1 height:30 isFill:true];
```


4. 添加spacing
---
默认的ATStackView的spacing是0，一旦设置了stack.spacing = 10之后，栈内所有元素之间的间距都是10。
```
ATVerStackView *stack = [ATVerStackView getStackVer];
stack.spacing = 10;
```
当然你还可以添加额外的间距。以下代码代表下一个元素和上一个元素之间的间距为30。如果你同时设置了stack.spacing = 10，那么它们的间距就是40。
```
[stack addSpacing:30];
```
ATStackView类型介绍：
--
除了横、纵向属性之外。ATStackView一共有三种类型。
就拿ATVerStackView来说：
```
/**创建一个垂直方向、子控件从上到下布局的栈*/
+(ATVerStackView *)getStackVer;
/**创建一个垂直方向、子控件居中布局的栈*/
+(ATVerStackView *)getStackVerCenter;
/**创建一个垂直方向、子控件均分的栈*/
+(ATVerStackView *)getStackVerEqueal;
```
当然，它们都有对应的快速添加方法(UIView+ATStack.h)：
```
/**快速创建一个垂直方向、子控件从上到下布局的栈*/
-(ATVerStackView *)addStackVer;
/**快速创建一个垂直方向、子控件居中布局的栈*/
-(ATVerStackView *)addStackVerCenter;
/**快速创建一个垂直方向、子控件均分的栈*/
-(ATVerStackView *)addStackVerEqual;
```
注：开发者在使用StackVer类型时，可以调用
```
-(void)addArrangedSubview:(UIView*)view height:(CGFloat)height isFill:(BOOL)isFill position:(ATStackViewPosition)position;
```
通过设置 position  = ATStackViewPositionTail ，可以将元素添加至头部，或者尾部（默认是添加至头部）。
意思就是说，ATStackView可以从尾部开始添加元素。
想要ATStackView能从底部添加元素必须得满足以下两个条件：
1. 创建的ATStackView是第一种类型。（addStackVer 或 addStackHor ，getStackVer 或 getStackHor ）。
2. 父视图不是UIScrollView类型。

实战：
--
微信-发现
----
50多行代码轻松实现“微信-发现”页面的简单布局。全程无frame设置，无一句约束代码。
![image.png](https://upload-images.jianshu.io/upload_images/5353063-10347eb9aff8a9fc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

运行结果：
![image.png](https://upload-images.jianshu.io/upload_images/5353063-597336a4a5b91c31.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

####九宫格：
![image.png](https://upload-images.jianshu.io/upload_images/5353063-c31103e1a0a3cf3e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

对于水平方向，创建 addStackHorEqual 类型的ATHorStackView, 它能让内部每一个元素分配相同大小的宽度。
对于垂直方向，创建addStackVerCenter 类型的ATVerStackView，让内部元素直接从中间位置开始添加。

运行结果：
![image.png](https://upload-images.jianshu.io/upload_images/5353063-633058c8655e4018.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

（UIView+ATStack.h）扩展方法和属性介绍：
--
```
//添加分割线
-(UIView *)addLineSeparate;
-(UIView *)addLineSeparateWithLelfPadding:(CGFloat)leftPadding;
//隐藏元素，但是不改变其他元素的位置
-(void)setAt_hidden:(BOOL)hidden;
-(BOOL)at_hidden;
-(void)setAt_width:(CGFloat)witdh;
-(CGFloat)at_width;
-(void)setAt_height:(CGFloat)height;
-(CGFloat)at_height;
```
对于分割线来说，有两种方式来实现。
1. 通过设置stack.spacing = 0.5 ; 让间隔处显示出父视图的背景色。若如果分割线左边有边距，则可以使用第二种方式。
2.  addLineSeparateWithLelfPadding: (CGFloat)leftPadding，在控件底部添加一个分割线，leftPadding为左边距（当前的分割线风格好像都是这样的，左开右闭 - - ！）。

熟悉UIStackView的人肯定知道，子控件设置hidden = true的时候，这个控件不仅会隐藏，后面的元素位置也会自动向前移动。
为满足有些开发者不希望后面元素发生移动，拓展了at_hidden属性。一旦at_hidden = true, 该控件会隐藏，但是布局不发生改变。

而at_width，at_height 设置以后，会为控件添加相应的长宽约束。

建议与使用心得：
--
个人建议：并不是要求开发者完全使用ATStackView去布局，有些布局非常复杂的情况，使用约束可能更得心应手。
建议基于以下两点条件来衡量：
1.至少有两个控件需要布局。
2.所有子控件在某条准线上对齐。（比如中心对齐，头部或者底部对齐）
ATStackView默认的对齐方式 alignment = UIStackViewAlignmentCenter，可以根据自己的需求进行修改;
而axis属性和distribution已经被封装，不建议你对它进行修改。

[demo地址](https://github.com/AutoJiang/ATStackView/tree/master/Demo)
