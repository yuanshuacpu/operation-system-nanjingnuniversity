#include <algorithm>
#include <assert.h>
#include <cctype>
#include <dirent.h>
#include <fstream>
#include <iostream>
#include <map>
#include <sstream>
#include <stdlib.h>
#include <string>
#include <sys/types.h>
#include <unistd.h>
#include <vector>

#define ok 1

struct Process {
  int pid;
  int ppid;
  std::string name;
  std::string stat;
};

struct MapCompareType {
  int m_ispsort = 0; //

  MapCompareType(int ispsort) : m_ispsort(ispsort) {}

  bool operator()(const int &lhs, const int &rhs) const {
    if (m_ispsort) {
      return lhs < rhs;
    } else {
      return lhs > rhs;
    }
  }
};

std::map<int, Process> processes;
std::map<int, std::vector<int>> processTree;
class ProcessTree {

public:
  ProcessTree(int ispnum, int ispsort) : m_ispnum(ispnum), m_ispsort(ispsort) {
    processes =
        new std::map<int, Process, MapCompareType>(MapCompareType(ispsort));
    processTree = new std::map<int, std::vector<int>, MapCompareType>(
        MapCompareType(ispsort));
  }

  ~ProcessTree() {
    delete processes;
    delete processTree;
  }

  void run() {
    buildProcessTree();
    printProcessTree(1); // Start from init process (PID 1)
  }

private:
  int m_ispnum = 0;
  int m_ispsort = 0;
  std::map<int, Process, MapCompareType> *processes;
  std::map<int, std::vector<int>, MapCompareType> *processTree;

  void readProcessInfo(int pid) {
    std::ifstream statFile("/proc/" + std::to_string(pid) + "/stat");
    if (statFile.is_open()) {
      Process proc;
      statFile >> proc.pid >> proc.name >> proc.stat >> proc.ppid;
      proc.name =
          proc.name.substr(1, proc.name.size() - 2); // remove parentheses
      (*processes)[pid] = proc;
      (*processTree)[proc.ppid].push_back(pid);
    }
  }

  void buildProcessTree() {
    DIR *dir = opendir("/proc");
    if (dir == nullptr) {
      perror("opendir");
      return;
    }
    struct dirent *entry;
    while ((entry = readdir(dir)) != nullptr) {
      if (entry->d_type == DT_DIR) {
        std::string dirName = entry->d_name;
        bool ret = true;
        for (auto a : dirName) {
          if (!std::isdigit(a)) {
            ret = false;
            break;
          }
        }

        if (ret) {
          int pid = std::stoi(dirName);
          readProcessInfo(pid);
        }
      }
    }
    closedir(dir);
  }

  void printProcessTree(int pid, int level = 0) {
    for (int i = 0; i < level; ++i) {
      std::cout << "  ";
    }
    if ((*processes).find(pid) != (*processes).end()) {
      if (m_ispnum) {
        std::cout << (*processes)[pid].name << " (" << pid << ")" << std::endl;
      } else {
        std::cout << (*processes)[pid].name << std::endl;
      }
      if (m_ispsort) {

        std::sort((*processTree)[pid].begin(), (*processTree)[pid].end(),
                  std::less<int>());
      } else {
        std::sort((*processTree)[pid].begin(), (*processTree)[pid].end(),
                  [](int &lhs, int &rhs) { return 0; });
      }
      for (int childPid : (*processTree)[pid]) {
        printProcessTree(childPid, level + 1);
      }
    }
  }
};

int main(int argc, char *argv[]) {

  for (int i = 0; i < argc; i++) {
    assert(argv[i]);
    printf("argv[%d] = %s\n", i, argv[i]);
  }
  assert(!argv[argc]);

  int opt;

  int ispnum = 0;
  int ispsort = 0;

  while ((opt = getopt(argc, argv, "hpnV")) != -1) {
    switch (opt) {
    case 'h': {
      fprintf(stdout, "Usage: %s [-h] [-p] [-n] [-V]\n", argv[0]);
      exit(0);
    }
    case 'p': { // 打印每个进程的进程号

      ispnum = 1;
      break;
    }
    case 'n': { // 按照pid的数值从小到大顺序输出一个进程的直接孩子
      ispsort = 1;
      // ispnum = 1;
      break;
    }
    case 'V': { // 打印版本信息
      fprintf(stdout, "pstree version 1.0\n");
      exit(0);
    }
    case '?': {
      fprintf(stderr, "Usage: %s [-h] [-p] [-n] [-V]\n", argv[0]);
      exit(0);
    }
    }
  }

  ProcessTree processTree(ispnum, ispsort);
  processTree.run();

  return 0;
}
