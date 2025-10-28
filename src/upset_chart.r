# Cargamos las librerías necesarias para ejecutar todo el código
library(UpSetR)
library(grid)

# Importamos los datos
path <- "body_habits.csv"
body_habits <- read_csv(path) 

# Filtramos por individuos vegetarianos y separand también por géneros
body_habits_vegetarian_female <- body_habits[body_habits$diet_type == "Vegetarian" & body_habits$Gender == "Female",]
body_habits_vegetarian_male <- body_habits[body_habits$diet_type == "Vegetarian" & body_habits$Gender == "Male",]

# Creamos una lista con 4 sublistas, una por cada tipo de entrenamiento, y dichas sublistas contienen las mujeres vegetarianas que practican ese tipo de entrenamiento
x_female <- list(
    Yoga = sample(body_habits_vegetarian_female$ID,nrow(body_habits_vegetarian_female[body_habits_vegetarian_female$Workout_Type == "Yoga",])),
    HIIT = sample(body_habits_vegetarian_female$ID,nrow(body_habits_vegetarian_female[body_habits_vegetarian_female$Workout_Type == "HIIT",])),
    Strength = sample(body_habits_vegetarian_female$ID,nrow(body_habits_vegetarian_female[body_habits_vegetarian_female$Workout_Type == "Strength",])),
    Cardio = sample(body_habits_vegetarian_female$ID,nrow(body_habits_vegetarian_female[body_habits_vegetarian_female$Workout_Type == "Cardio",]))
)

# Creamos una lista con 4 sublistas, una por cada tipo de entrenamiento, y dichas sublistas contienen los hombres vegetarianos que practican ese tipo de entrenamiento
x_male <- list(
    Yoga = sample(body_habits_vegetarian_male$ID,nrow(body_habits_vegetarian_male[body_habits_vegetarian_male$Workout_Type == "Yoga",])),
    HIIT = sample(body_habits_vegetarian_male$ID,nrow(body_habits_vegetarian_male[body_habits_vegetarian_male$Workout_Type == "HIIT",])),
    Strength = sample(body_habits_vegetarian_male$ID,nrow(body_habits_vegetarian_male[body_habits_vegetarian_male$Workout_Type == "Strength",])),
    Cardio = sample(body_habits_vegetarian_male$ID,nrow(body_habits_vegetarian_male[body_habits_vegetarian_male$Workout_Type == "Cardio",]))
)

# Realizamos los gráficos UpSet
upset(fromList(x_female), 
      order.by = "freq",
      main.bar.color = "orange",
      sets.bar.color = "orange",
      text.scale = 1.5)
grid.text("Intersecciones entre los diferentes tipos de entrenamiento de las mujeres vegetarianas",
    x = 0.65,
    y = 0.97,
    gp = gpar(fontsize = 10, fontface = "bold"))

upset(fromList(x_male), 
      order.by = "freq",
      main.bar.color = "blue",
      sets.bar.color = "blue",
      text.scale = 1.5)
grid.text("Intersecciones entre los diferentes tipos de entrenamiento de los hombres vegetarianos",
    x = 0.65,
    y = 0.97,
    gp = gpar(fontsize = 10, fontface = "bold"))