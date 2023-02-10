WAITS

aktuelles Warten
SELECT *
FROM sys.dm_exec_requests
CROSS APPLY sys.dm_exec_sql_text (sql_handle)


 SOS_SCHEDULER_YIELD #Quantum
 Wartezeiten, die ich sehe, sind Abfragen, 
 die Scans von Seiten durchf�hren, die sich im Speicher befinden 
 und sich nicht �ndern, daher gibt es keine Konkurrenz f�r den Seitenzugriff 
 und der Scan-Thread kann ausgef�hrt werden, bis er sein Thread-Quantum ersch�pft hat. 
 Dies kann daran liegen, dass ein Abfrageplan f�lschlicherweise einen Tabellenscan 
 durchf�hrt, oder es k�nnte ein normaler Teil Ihrer Arbeitslast sein. 
 Genau wie CXPACKET- Wartezeiten sollten Sie nicht zu dem Schluss kommen, 
 dass SOS_SCHEDULER_YIELD- Wartezeiten schlecht sind.
 FIFO-- Quantum ersch�pft-- Wartenschlange (vs Ressoucensteurung)


 SOS_SCHEDULER_DISPATCHER #nichtschlecht
 Bei diesem Wartetyp wartet ein Thread in SQLOS auf etwas zu tun. 
 Dieses Warten beginnt, wenn der Thread in den Ruhezustand �bergeht, 
 und endet, wenn dem Thread etwas zu tun gegeben wird.


 THREADPOOLS
 Tritt auf, wenn eine Aufgabe darauf wartet, 
 dass ein Worker ausgef�hrt wird. Dies kann darauf hinweisen, 
 dass die maximale Worker-Einstellung zu niedrig ist oder 
 dass Batchausf�hrungen ungew�hnlich lange dauern, 
 wodurch die Anzahl der verf�gbaren Worker verringert wird, 
 um andere Batches zu befriedigen 

