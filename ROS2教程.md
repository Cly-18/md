# ROS2教程

## ROS2安装

```shell
# 设置编码为UTF-8
apt install locales
locale-gen en_US en_US.UTF-8
update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export Lang=en_US.UTF-8

# 添加源
apt install curl gnupg lsb-release
curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg ##报错则需指定raw.githubusercontent.com的IP地址  更改hosts
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

# 安装ros2
apt install ros-humble-desktop

# 配置环境变量
source /opt/ros/humble/setup.bash
echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

# 安装colcon
apt install python3-colcon-common-extensions
```

## ROS2创建功能包

* shell

```shell
# 创建功能包  小写字母、数字和下划线
ros2 pkg create my_pkg_01 --build-type ament_cmake --dependencies rclcpp
```

* 编写节点代码 myNode01.cpp 

```c++
//面向过程
#include "rclcpp/rclcpp.hpp"

int main(int argc, char **argv)
{
    // 初始化
    rclcpp::init(argc, argv);
    // 新建节点
    auto node = std::make_shared<rclcpp::Node>("myNode01");
    // 打印
    RCLCPP_INFO(node->get_logger(), "hello world !");
    // 循环节点
    rclcpp::spin(node);
    rclcpp::shutdown();
    return 0;
}
//----------------------------------------------------------
//面向对象
#include "rclcpp/rclcpp.hpp"

class MyNode02 : public rclcpp::Node
{
public:
    MyNode02(std::string name) : Node(name)
    {
        RCLCPP_INFO(this->get_logger(), "hello world !");
    }
};

int main(int argc, char **argv)
{
    rclcpp::init(argc, argv);
    auto node = std::make_shared<MyNode02>("myNode02");
    rclcpp::spin(node);
    rclcpp::shutdown();
    return 0;
}
```

* cmake

```cmake
# 在末尾添加
# myNode01  指定源文件
add_executable(myNode01
  src/myNode01.cpp
)
# 添加依赖
ament_target_dependencies(myNode01
  rclcpp
)
# 安装到install
install(TARGETS
  myNode01
  DESTINATION lib/${PROJECT_NAME}
)
```

* 生成

```shell
colcon build --packages-select my_pkg_01
```

* 运行

```shell
# 更新安装包
source install/setup.bash
# 执行
ros2 run my_pkg_01 myNode01
# 查看节点信息
ros2 node list
ros2 node info /myNode01
```

## ROS2通信

* 节点通信查看工具

```shell
 rqt_graph
```

* 定时发布

```c++
#include "rclcpp/rclcpp.hpp"
// 导入数据类型
#include "std_msgs/msg/string.hpp"

class Node2 : public rclcpp::Node
{
private:
    // 发布者
    rclcpp::Publisher<std_msgs::msg::String>::SharedPtr pub_ptr;
    // 定时器
    rclcpp::WallTimer<std::_Bind<void (Node2::*(Node2 *))()>, (void *)nullptr>::SharedPtr timer;

public:
    Node2(std::string name) : Node(name)
    {
        pub_ptr = this->create_publisher<std_msgs::msg::String>("topic", 10);
        timer = this->create_wall_timer(std::chrono::seconds(1), std::bind(&Node2::pubMsg, this));
    }
    void pubMsg()
    {
        static int i = 0;
        std_msgs::msg::String msg;
        msg.data = std::to_string(++i).insert(0, "消息...");
        pub_ptr->publish(msg);
        RCLCPP_INFO(this->get_logger(), "发送消息：%d", i);
    }
};

int main(int argc, char **argv)
{
    rclcpp::init(argc, argv);
    auto n = std::make_shared<Node2>("node2");
    rclcpp::spin(n);
    rclcpp::shutdown();
    return 0;
}
```

* 订阅

```c++
#include "rclcpp/rclcpp.hpp"
// 导入数据类型
#include "std_msgs/msg/string.hpp"

class Node1 : public rclcpp::Node
{
private:
    // 订阅者
    rclcpp::Subscription<std_msgs::msg::String>::SharedPtr sub_ptr;
    // 创建回调函数
    void callback(const std_msgs::msg::String::SharedPtr ptr)
    {
        RCLCPP_INFO(this->get_logger(), "收到消息：%s", ptr->data.c_str());
    }

public:
    Node1(std::string name) : Node(name)
    {
        sub_ptr = this->create_subscription<std_msgs::msg::String>(
            "topic",
            10,
            std::bind(&Node1::callback, this, std::placeholders::_1));
    }
};

int main(int argc, char **argv)
{
    rclcpp::init(argc, argv);
    auto n = std::make_shared<Node1>("node1");
    rclcpp::spin(n);
    rclcpp::shutdown();
    return 0;
}
```

* cmake

```cmake
# node1  指定源文件
add_executable(node1
  src/node1/node1.cpp
)
# 添加依赖
ament_target_dependencies(node1
  rclcpp
  std_msgs
)

# node2  指定源文件
add_executable(node2
  src/node2/node2.cpp
)
# 添加依赖
ament_target_dependencies(node2
  rclcpp
  std_msgs
)

# 安装到install
install(TARGETS
  node1
  node2
  DESTINATION lib/${PROJECT_NAME}
)
```



