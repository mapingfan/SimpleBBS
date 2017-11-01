# SimpleBBS
## JavaWeb学习项目之简易BBS；

### Day1
Q1：IDEA中把特定`jar`文件引入到特定目录中？

A1：`Tomcat`项目需要把第三方用到的`jar`文件放到`lib`文件下才能找到（放到全局不行）。点击项目项目结构，点右边加号，先引入相关包，然后在引入的包上右键选择移动到指定的目录即可。
笨方法可以直接从硬盘拷贝复制。

---

### Day2
Q1：发表新帖子如何根据id设置rootid？

A1：这个地方id字段是数据库生成的；我们如何在插入的时候获得这个字段。
```
PreparedStatement preparedStatement = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
ResultSet resultSet = preparedStatement.getGeneratedKeys();
resultSet.next();
int key = resultSet.getInt(1);
通过上面的方法，我们可以获得那个自动生成的字段，从而设置好我们的rootid字段。
```

Q2：如何处理把表单提交到自己所在页面？

A2：
我们可以把表单提交到当前页面，但是我们有两种方式访问这个页面（一是浏览器直接访问，二是跳转），如何进行区分？这个地方的做法是设置一个隐藏的`input`字段，通过这个传递参数。通过参数判断是如何访问页面的，这个属于惯常做法，要学会。

Q3: 登录控制的两种实现方式

A3: `session`控制，在`session`里面设置属性和值，这些属性和值可以在`jsp`页面中传递。可以通过这些值来控制权限。
其次就是可以通过页面重定向，并在`url`后传递相应的参数，然后通过参数进行判断。
