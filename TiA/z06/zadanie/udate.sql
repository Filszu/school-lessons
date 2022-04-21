
ALTER TABLE `dostawcy`
  ADD PRIMARY KEY (`id_dostawcy`);


ALTER TABLE `magazyn`
  ADD KEY `id_towaru` (`id_towaru`);


ALTER TABLE `towary`
  ADD PRIMARY KEY (`id_towaru`),
  ADD KEY `id_dostawcy` (`id_dostawcy`);




ALTER TABLE `dostawcy`
  MODIFY `id_dostawcy` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `towary`
  MODIFY `id_towaru` int(11) NOT NULL AUTO_INCREMENT;




ALTER TABLE `magazyn`
  ADD CONSTRAINT `magazyn_ibfk_1` FOREIGN KEY (`id_towaru`) REFERENCES `towary` (`id_towaru`);


ALTER TABLE `towary`
  ADD CONSTRAINT `towary_ibfk_1` FOREIGN KEY (`id_dostawcy`) REFERENCES `dostawcy` (`id_dostawcy`);