# Clean up workspace and detach non-basic packages ============================
rm(list = ls(all = TRUE))
suppressWarnings(
  if (!is.null(names(sessionInfo()$otherPkgs))) {
    invisible(lapply(
      paste0('package:', names(sessionInfo()$otherPkgs)),
      detach,
      character.only = TRUE,
      unload = TRUE
    ))}
)
graphics.off()

## read_data

library(readxl)
library(ggplot2)
library(gridExtra)
library(showtext)
minority <- read_excel("1997-2019_minority_staff_faculty.xlsx")

table(minority$edu_level)
minority$edu_level1 <- factor(
  minority$edu_level,
  levels = c("university", "high_school", "junior_high","primary_school","kindergarden"),
  labels = c("高等教育", "高中","初中","小学","学前教育"),
  ordered = TRUE)

showtext_auto()
dev.new()
pdf("faculty+staff.pdf", width=12, height=12)
grid.arrange(p1, p2, nrow = 2)
p1<-ggplot(data=minority, aes(x=year, y=faculty, fill=edu_level1)) +
  geom_bar(stat="identity")+scale_fill_grey() + 
  labs(title="1997-2019专职教师与教职工人数",
  x ="年份", y = "专职教师（万人）")+labs(fill="教育程度")
p2<-ggplot(data=minority, aes(x=year, y=staff, fill=edu_level1)) +
  geom_bar(stat="identity")+scale_fill_grey() + 
  labs(x ="年份", y = "教职工（万人）")+labs(fill="教育程度")
dev.off()
