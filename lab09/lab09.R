# 載入 plumber 套件
library(plumber)

# 建立學生資料集
students <- data.frame(
  id = integer(0),
  name = character(0),
  height = numeric(0),
  weight = numeric(0),
  stringsAsFactors = FALSE
)
current_id <- 0

#* @get /students
# 回傳所有學生資料
function() {
  students
}

#* @post /students
# 新增一名學生，並自動產生 id
function(name, height, weight) {
  current_id <<- current_id + 1
  students <<- rbind(students, data.frame(
    id = current_id, 
    name = name, 
    height = as.numeric(height), 
    weight = as.numeric(weight)
  ))
  
  # 儲存 current_id
  save(current_id, file = "current_id.RData")
  
  list(status = "Student added", id = current_id)
}

#* @patch /students/:id
function(id, name = NULL, height = NULL, weight = NULL) {
  id <- as.numeric(id)
  row <- which(students$id == id)
  if (length(row) == 0) return(list(error = "Student not found"))
  
  if (!is.null(name)) students$name[row] <<- name
  if (!is.null(height)) students$height[row] <<- as.numeric(height)
  if (!is.null(weight)) students$weight[row] <<- as.numeric(weight)
  
  list(status = "Student updated", id = id)
}

#* @delete /students/:id

function(id) {
  id <- as.numeric(id)
  row <- which(students$id == id)
  if (length(row) == 0) return(list(error = "Student not found"))
  
  students <<- students[-row, ]
  list(status = "Student deleted", id = id)
}

#* @get /plot

#* @serializer png
function() {
  plot(students$height, students$weight, 
       xlab = "Height", ylab = "Weight", 
       main = "Height vs Weight")
}
