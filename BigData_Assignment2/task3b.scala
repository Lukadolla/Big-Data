import org.apache.spark.sql.functions._

val input = spark.read.format("csv").option("header", "true").option("inferSchema", "true").load("github-big-data.csv")

input.select("*").filter($"description".rlike("\\b[dD]ata\\b")).filter($"language".isNotNull).count(



