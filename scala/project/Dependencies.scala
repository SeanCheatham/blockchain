import sbt._

object Dependencies {
  val logging: Seq[ModuleID] = Seq(
    "ch.qos.logback" % "logback-classic" % Versions.logback,
    "ch.qos.logback" % "logback-core" % Versions.logback,
    "org.slf4j" % "slf4j-api" % "2.0.9",
    "org.typelevel" %% "log4cats-slf4j" % "2.6.0"
  )

  val cats = Seq(
    "org.typelevel" %% "cats-core" % Versions.cats,
    "org.typelevel" %% "cats-effect" % Versions.catsEffect
  )

  val scalaCache = Seq(
    "com.github.cb372" %% "scalacache-caffeine" % "1.0.0-M6"
  )

  val fs2 = Seq(
    "co.fs2" %% "fs2-core" % Versions.fs2,
    "co.fs2" %% "fs2-io" % Versions.fs2
  )

  val bouncycastle = Seq(
    "org.bouncycastle" % "bcprov-jdk18on" % "1.77"
  )

  val scodec = Seq(
    "org.scodec" %% "scodec-core" % "2.2.2"
  )

  val levelDbJni = Seq(
    "com.halibobor" % "leveldbjni-all" % "1.23.2"
  )

  val caseApp = Seq(
    "com.github.alexarchambault" %% "case-app" % "2.1.0-M26"
  )

  val mUnitTest = Seq(
    "org.scalameta" %% "munit" % "0.7.29",
    "org.scalameta" %% "munit-scalacheck" % "0.7.29",
    "org.typelevel" %% "munit-cats-effect-3" % "1.0.7",
    "org.typelevel" %% "scalacheck-effect-munit" % "1.0.4"
  ).map(_ % Test)

  val graalVM = Seq(
    "org.graalvm.polyglot" % "polyglot" % "23.1.2",
    "org.graalvm.polyglot" % "js" % "23.1.2"
  )
}

object Versions {
  val cats = "2.10.0"
  val catsEffect = "3.5.2"
  val fs2 = "3.9.3"
  val logback = "1.4.14"
}
