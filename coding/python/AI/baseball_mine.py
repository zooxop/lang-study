import random

SIZE = 4  # 4자리 숫자 야구게임
POPULATION_SIZE = 8  # 유전자 개수
MUTATION_RATE = 0.15  # 돌연변이 발생 확률: 15%
population = []
target = []  # 야구게임 정답

"""
적합도(fitness) 계산 방법: 
 - 초기값: 0
 - ball: +1
 - strike: +5
"""


# 유전자 Class
class Chromosome:
    def __init__(self, g=[]):
        self.genes = g.copy()  # 유전자 리스트
        self.fitness = 0  # 적합도
        if self.genes.__len__() == 0:
            for i in range(SIZE):
                num = str(random.randrange(0, 10))
                while num in self.genes:  # 숫자 중복 방지
                    num = str(random.randrange(0, 10))
                self.genes.append(num)

    def calc_fitness(self):  # 적합도 계산
        self.fitness = 0
        for expected, actual in zip(target, self.genes):
            if expected == actual:  # strike
                self.fitness += 5
            elif actual in target:  # ball
                self.fitness += 1
        return self.fitness

    def __str__(self):
        return ''.join(self.genes)


def pick_baseball_num(length):  # 랜덤 야구 숫자 생성
    num = random.randrange(0, 10)

    for i in range(length):
        while str(num) in target:  # 숫자 중복방지
            num = random.randrange(0, 10)
        target.append(str(num))

    return ''.join(target)


# 선택 연산
def select(pop):
    max_value = sum([x.calc_fitness() for x in population])
    pick = random.uniform(0, max_value)
    current = 0

    # 룰렛 휠에서 어떤 조각에 속하는지 탐색
    for x in pop:
        current += x.calc_fitness()
        if current > pick:
            return x


# 교차 연산
def crossover(pop):
    father = select(pop)
    mother = select(pop)

    idx = random.randint(1, SIZE - 2)
    child1 = father.genes[:idx] + mother.genes[idx:]
    child2 = mother.genes[:idx] + father.genes[idx:]
    return child1, child2


# 돌연변이 생성
def mutate(pop):
    for i in range(SIZE):
        if random.random() < MUTATION_RATE:
            num = str(random.randrange(0, 10))
            while num in pop.genes:  # 숫자 중복방지
                num = str(random.randrange(0, 10))

            pop.genes[i] = num


def print_p(pop, number):
    print("세대 번호:", number)
    i = 1
    for x in pop:
        print("염색체 #", i, "=", x, "적합도 =", x.calc_fitness())
        i += 1
    print("")


# Start main program
print("야구게임 정답 :", pick_baseball_num(SIZE))

for _ in range(POPULATION_SIZE):
    population.append(Chromosome())

count = 0
population.sort(key=lambda x: x.calc_fitness(), reverse=True)
print_p(population, count)
count = 1
isSuccess = True

while population[0].calc_fitness() < 20:  # 4자리 게임이므로, 최대 적합도는 20
    new_pop = []

    for _ in range(POPULATION_SIZE//2):
        c1, c2 = crossover(population)
        new_pop.append(Chromosome(c1))
        new_pop.append(Chromosome(c2))

    # 자식 세대가 부모 세대를 대체한다.
    # 깊은 복사를 수행한다.
    population = new_pop.copy()

    # 돌연변이 연산
    for c in population:
        mutate(c)

    # 출력을 위한 정렬
    population.sort(key=lambda x: x.calc_fitness(), reverse=True)
    print_p(population, count)

    count += 1
    if count > 300:
        print("300회 이내에 탐색 실패")
        isSuccess = False
        break

if isSuccess:
    print("정답:", population[0].__str__())
    print("세대번호 =", count-1)
















