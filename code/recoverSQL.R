.
(codings <- RQDAQuery("
SELECT cod.cid AS codeID, free.name AS code, cod.selfirst, cod.seltext, cod.selend,
  cod.fid AS fileID
FROM coding AS cod
INNER JOIN freecode AS free ON free.id = cod.cid
WHERE cod.status = 1 AND free.status = 1
"))
write.csv(
  codings, fileEncoding = "UTF-8", row.names = F,
  file = paste0(getwd(), "/rstudio/npj-sci-learning/data/codings.csv"))

# Classifications by Codes

(codingsByFileCat <- RQDAQuery("
SELECT cod.cid AS codeID, free.name AS code, cod.selfirst, cod.selend,
  cod.fid AS fileID, fcat.catid AS fileCatID, fcat.name AS fileCat
FROM coding AS cod
INNER JOIN freecode AS free ON free.id = cod.cid
INNER JOIN treefile AS tfile ON tfile.fid = cod.fid
INNER JOIN filecat AS fcat ON fcat.catid = tfile.catid
WHERE cod.status = 1 AND free.status = 1 AND tfile.status = 1 AND fcat.status = 1
"))
write.csv(
  codingsByFileCat, fileEncoding = "UTF-8", row.names = F,
  file = paste0(getwd(), "/rstudio/npj-sci-learning/data/codingsByFileCat.csv"))


(codingsByCases <- RQDAQuery("
SELECT cod.cid AS codeID, free.name AS code, cod.selfirst, cod.selend,
  cases.id AS caseID, cases.name AS caseName,
  cod.fid AS fileID
FROM coding AS cod
INNER JOIN freecode AS free ON free.id = cod.cid
INNER JOIN caselinkage AS clink ON clink.fid = cod.fid
INNER JOIN cases ON cases.id = clink.caseid
WHERE cod.status = 1 AND free.status = 1 AND clink.status = 1 AND cases.status = 1
"))
write.csv(
  codingsByCases, fileEncoding = "UTF-8", row.names = F,
  file = paste0(getwd(), "/rstudio/npj-sci-learning/data/codingsByCases.csv"))


(codingsByCasesAndFileCat <- RQDAQuery("
SELECT cod.cid AS codeID, free.name AS code, cod.selfirst, cod.selend,
  cases.id AS caseID,  cases.name AS caseName,
  cod.fid AS fileID, fcat.catid AS fileCatID, fcat.name AS fileCat
FROM coding AS cod
INNER JOIN freecode AS free ON free.id = cod.cid
INNER JOIN caselinkage AS clink ON clink.fid = cod.fid
INNER JOIN cases ON cases.id = clink.caseid
INNER JOIN treefile AS tfile ON tfile.fid = cod.fid
INNER JOIN filecat AS fcat ON fcat.catid = tfile.catid
WHERE cod.status = 1 AND free.status = 1 AND clink.status = 1 AND cases.status = 1 AND tfile.status = 1 AND fcat.status = 1
"))
write.csv(
  codingsByCasesAndFileCat, fileEncoding = "UTF-8", row.names = F,
  file = paste0(getwd(), "/rstudio/npj-sci-learning/data/codingsByCasesAndFileCat.csv"))


## Classification by Code Categories

(codingsByCategories <- RQDAQuery("
SELECT cod.cid AS codeID, free.name AS code, cod.selfirst, cod.selend,
  cat.catid AS catID, cat.name AS catName,
  cod.fid AS fileID
FROM coding AS cod
INNER JOIN freecode AS free ON free.id = cod.cid
INNER JOIN treecode AS tree ON tree.cid = cod.cid
INNER JOIN codecat AS cat ON cat.catid = tree.catid
WHERE cod.status = 1 AND free.status = 1 AND tree.status = 1 AND cat.status = 1
"))
write.csv(codingsByCategories, fileEncoding = "UTF-8", row.names = F,
          file = paste0(getwd(), "/rstudio/npj-sci-learning/data/codingsByCategories.csv"))


(codingsByCategoriesAndFileCat <- RQDAQuery("
SELECT cod.cid AS codeID, free.name AS code, cod.selfirst, cod.selend,
  cat.catid AS catID, cat.name AS catName,
  cod.fid AS fileID, fcat.catid AS fileCatID, fcat.name AS fileCat
FROM coding AS cod
INNER JOIN freecode AS free ON free.id = cod.cid
INNER JOIN treefile AS tfile ON tfile.fid = cod.fid
INNER JOIN filecat AS fcat ON fcat.catid = tfile.catid
INNER JOIN treecode AS tree ON tree.cid = cod.cid
INNER JOIN codecat AS cat ON cat.catid = tree.catid
WHERE cod.status = 1 AND free.status = 1 AND tfile.status = 1 AND fcat.status = 1 AND tree.status = 1 AND cat.status = 1
"))
write.csv(codingsByCategoriesAndFileCat, fileEncoding = "UTF-8", row.names = F,
          file = "rstudio/npj-sci-learning/data/codingsByCategoriesAndFileCat.csv")


(codingsByCategoriesAndCases <- RQDAQuery("
SELECT cod.cid AS codeID, free.name AS code, cod.selfirst, cod.selend,
  cases.id AS caseID, cases.name AS caseName,
  cat.catid AS catID, cat.name AS catName,
  cod.fid AS fileID
FROM coding AS cod
INNER JOIN freecode AS free ON free.id = cod.cid
INNER JOIN caselinkage AS clink ON clink.fid = cod.fid
INNER JOIN cases ON cases.id = clink.caseid
INNER JOIN treecode AS tree ON tree.cid = cod.cid
INNER JOIN codecat AS cat ON cat.catid = tree.catid
WHERE cod.status = 1 AND free.status = 1 AND clink.status = 1 AND cases.status = 1 AND tree.status = 1 AND cat.status = 1
"))
write.csv(codingsByCategoriesAndCases, fileEncoding = "UTF-8", row.names = F,
          file = "rstudio/npj-sci-learning/data/codingsByCategoriesAndCases.csv")


(codingsByCategoriesAndCasesAndFileCat <- RQDAQuery("
SELECT cod.cid AS codeID, free.name AS code, cod.selfirst, cod.selend,
  cases.id AS caseID,  cases.name AS caseName,
  cod.fid AS fileID, fcat.catid AS fileCatID, fcat.name AS fileCat
FROM coding AS cod
INNER JOIN freecode AS free ON free.id = cod.cid
INNER JOIN caselinkage AS clink ON clink.fid = cod.fid
INNER JOIN cases ON cases.id = clink.caseid
INNER JOIN treefile AS tfile ON tfile.fid = cod.fid
INNER JOIN filecat AS fcat ON fcat.catid = tfile.catid
INNER JOIN treecode AS tree ON tree.cid = cod.cid
INNER JOIN codecat AS cat ON cat.catid = tree.catid
WHERE cod.status = 1 AND free.status = 1 AND clink.status = 1 AND cases.status = 1 AND tfile.status = 1 AND fcat.status = 1 AND tree.status = 1 AND cat.status = 1
"))
write.csv(codingsByCasesAndFileCat, fileEncoding = "UTF-8", row.names = F,
          file = "rstudio/npj-sci-learning/data/codingsByCategoriesAndCasesAndFileCat.csv")






