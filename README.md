![](https://img.shields.io/badge/Microverse-blueviolet)

# Advanced Building Blocks - Enumerable Methods

[Collaborative project]

> In this project, we are implementing our custom enumerable methods of Ruby.

Covered methods

- #my_each
- #my_each_with_index
- #my_select
- #my_all?
- #my_any?
- #my_none?
- #my_count
- #my_map
- #my_inject
- #multiply_els which multiplies all the elements of the array together by using #my_inject, e.g. multiply_els([2,4,5]) #=> 40

## Built With

- Ruby

## Getting Started

Clone

```git
https://github.com/Leon-Mbegera/Enumerables
```

To get a local copy up and running, follow these simple example steps.


1. Open a terminal window and enter `clone https://github.com/Leon-Mbegera/Enumerables`
2. Run git checkout  `-b your-branch-name`. Make your contributions
3. Type in terminal  `ruby enumerables.rb` to start testing
4. Push your branch up to your forked repository
5. Open a Pull Request if you want to merge branches with a detailed description of the development branch of the original project for a review


### Prerequisites

Ruby installed localy

## Run test cases using RSpec

- In your terminal, run `bundle install` to download and install the testing framework"
- Type `bundle exec rspec` to run the test cases already written

#### my_each

```
[1,2,3,4,5,6].my_each{|i| p i}
=> 123456
```

#### my_each_with_index

```
[3,5,8,1].my_each_with_index{|element, i| p "#{element}: #{i}"} 
=> "3 0"
   "5 1"
   "8 2"
   "1 3"
```

#### my_select

```
[1,2,3,4,5,6].my_select(&:odd?)
=> [1,3,5]
```

#### my_all?

```
[1,2,3,4,5,6].my_all?(&:even?)
=> false
```

#### my_any?

```
[1,2,3,4,5,6].my_any?(&:odd?)
=> true
```

#### #my_none?

```
[1,2,3,4,5,6].my_none?(&:odd?)
=> true
```

#### #my_count

```
[1,2,3].my_count
=> 3
[1,2,3].my_count { |x| x > 1}
=> 2
```

#### #my_map

```
[1,5].my_map { |x| x * 2 }
=> [2, 10]

[1,2,3,4,5].my_map Proc.new { |x| x * 4 }
=> [4,8,12,16,20]
```

#### #my_inject

```
(5..10).my_inject(:+)
=> 45
(5..10).my_inject { |sum, n| sum + n }
=> 45
```

#### #multiply_els

```
[1,2,4,5,6].my_multiply_els
=> 240
```
 
## Authors

👤 **Shoira Toshpulatova**

- GitHub: [@githubhandle](https://github.com/shoirata)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/shoira-tashpulatova-bab4a7122/)

![Shoira's GitHub stats](https://github-readme-stats.vercel.app/api?username=shoirata&count_private=true&theme=dark&show_icons=true)


👤 **Leon**

- GitHub: [@githubhandle](https://github.com/Leon-Mbegera)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/leon-mbegera-053991174/)

![Leon's GitHub stats](https://github-readme-stats.vercel.app/api?username=Leon-Mbegera&count_private=true&theme=dark&show_icons=true)

## Acknowledgments

- Thanks to my coding partner and the team
- Inspiration
