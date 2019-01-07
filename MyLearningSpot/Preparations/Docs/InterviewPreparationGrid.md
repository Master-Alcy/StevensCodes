# Behavioral Questions

## Prepare Grid

**Things need to re-consider:**

* HashMap -> Why Red-Black-Tree -> Simple Implementation
* Need to go through Trie Structure
* How TreeMap is Implemented, complexity
* How to handle high concurrency
  * Front: React + Webpack, Back: nginx + SpringBoot + Redis + MySQL, docker(容器化部署)
  * Docker (nginx) -> React + Webpack -> rest api -> service -> dao cache -> mysql redis
  * mysql (store) -> redis (cache, 水平扩容?) -> [dao layer] (handle mysql) -> [cache layer] (handle redis) -> Service (project logic) -> Rest API (offer front-end with rest interface) -> React (module front-end) -> Webpack (package up and deploy) -> Nginx (Gateway, load-balancing)
  * MySQL, Redis, Nginx and SpringBoot all deploy with Docker
* What's MySQL's Data Structure(B+ Tree), Why use this
* How to make Index with MySQL
* Why Index(hash) is stored in B+ tree, time complexity (related to height, around O(log n))
* After Index store, time is O(1), why still use B+ tree
  * DPS's 3 iterating order
  * binary tree
  * binary search tree
  * balanced binary tree
  * red-black tree
    * A kind of balancing tree to reduce max height
    * DFS's efficiency depends on height
    * Know some TreeSet
  * B tree
    * self balancing, data in order, could reduce height
    * data stored in disk, if too large to load to disk at once, we need B-Tree to load a node of it, and go down
    * In cache, red-black tree is faster than B-Tree, but about Disk Operations, B-Tree is better
  * B+ tree
    * Base on B-Tree, data stored in leaf nodes, and leaf nodes are connected with pointer => linked list
    * For DataBase, `SELECT` get multiple data, like 10 data from 7 - 17, only need to find head and tail
    * Also like B-Tree, can load one node at a time to get data separately, lower height and increase search efficiency
  * dictionary tree
* What's MongoDB's Data Structure, Why?
* Why for DataBase, it's common to use

| Common Questions          | Internship at Lvxin                | React_Library_System                      | Financial_Data_Acuiring_Server                    | Compressed_Trie_Simple_Search_Engine     |
| ------------------------- | ---------------------------------- | ----------------------------------------- | ------------------------------------------------- | ---------------------------------------- |
| Challenges                | Unknown Techs, New Environment     | New Tech, Big Project, Data commu         | Threading, Java-Based Data Transfer, Set up MySQL | Compressed Trie Structure                |
| Mistakes/Failures         | Lake of Communication with Manager | "this.state" Related, New Tech Bugs       | Too much code without debug                       | Many Bugs in Compressed Trie             |
| Enjoyed                   | School Knowledge in Work           | React Components, Easy for Understanding  | Fully control of Resources                        | Low Space Complexity                     |
| Leadership                |                                    | Git, VS-Live_Share, WeChat, Test-Group    |                                                   |                                          |
| Conflicts                 |                                    | Hard to Group, Cost for New Tech          |                                                   |                                          |
| What you'd do differently | Actively Commu with Colleagues     | Learn while Doing, not Learn before Doing | Test Data Transfer Before Making Interface        | Ranking, Relate with Title and Key Words |

### Weaknesses

* I don't have enough exprience in giving people with different technology backgroup with reasonable work. This result in my overloading myself in project and people who want to learn don't get enough chance. I've learned to seperate a large project into small chuncks of work with differnt techonology requirement and I believe I can do better in the future.
* I only have simple DataBase and multi-threading experience, and lack of that for a large usage in big company's workflow. I have started working on that with reading tech-blogs of others.
* I write everything like a lab report, which is from my education. I'm not good at writing fancy words but I do good at making graphs.

### Good At

* I learn fast.
* Tend to fullfill requirements in every detail.
* Love to and have studied to write clean code.

### Questions to Interviewer