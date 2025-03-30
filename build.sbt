ThisBuild / scalaVersion := "2.13.12"

lazy val root = (project in file("."))
  .settings(
    name := "MyPolyglotProject",
    version := "0.1.0",
    scalaVersion := "2.13.12",

    Compile / unmanagedSourceDirectories += baseDirectory.value / "src/main/java",
    Test / unmanagedSourceDirectories += baseDirectory.value / "src/test/java",

    libraryDependencies ++= Seq(
      "org.clojure" % "clojure" % "1.11.1",
      "org.scala-lang.modules" %% "scala-collection-compat" % "2.11.0"
    )
  )
