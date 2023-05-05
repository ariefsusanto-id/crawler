#!/bin/bash
# Maintenance : lychee
# lycheehybrid@gmail.com

baseDir=/home/lychee/crawler
pathLogPolicy=$baseDir/logpolicy/

# Clearing
echo "Removing Data"
rm -rf $baseDir/result.txt
rm -rf $baseDir/resultDouble.txt
echo  "Department,Nama Karyawan,Computer Name,IP Address,CsManufacturer,CsModel,BiosReleaseDate,OsName,WindowsInstall" > $baseDir/result.txt
for d in $pathLogPolicy*
# For sample one user
# for d in '/home/lychee/script/logpolicy/Surabaya Branch-Iska Aprilia'
do
  cd "$d"
  nilai=$(ls -dq *devicesInformation* | wc -l)
  
  if [ $nilai == 1 ]
  then

    for file in devicesinformation
    do
  
      grep -r devicesInformation* -e 'Department' > vDepartment.tmp
      sed -i 's/Department                     : //g' vDepartment.tmp
      Department=$(cat vDepartment.tmp)
      echo  $Department >> $baseDir/result.txt

      grep -r devicesInformation* -e 'Nama Karyawan' > vKaryawan.tmp
      sed -i 's/Nama Karyawan                  : //g' vKaryawan.tmp
      Karyawan=$(cat vKaryawan.tmp)
      echo  "-,"${Karyawan} >> $baseDir/result.txt

      grep -r devicesInformation* -e 'Computer Name' > vComputerName.tmp
      sed -i 's/Computer Name                  : //g' vComputerName.tmp
      ComputerName=$(cat vComputerName.tmp)
      echo  "-,"${ComputerName} >> $baseDir/result.txt

      grep -r devicesInformation* -e 'IP Address' > vIpAddress.tmp
      sed -i 's/IP Address                     : //g' vIpAddress.tmp
      IpAddress=$(cat vIpAddress.tmp)
      echo  "-,"${IpAddress} >> $baseDir/result.txt

      grep -r devicesInformation* -e 'CsManufacturer' > vCsManufacturer.tmp
      sed -i 's/CsManufacturer                 : //g' vCsManufacturer.tmp
      CsManufacturer=$(cat vCsManufacturer.tmp)
      echo  "-,"${CsManufacturer} >> $baseDir/result.txt

      grep -r devicesInformation* -e 'CsModel' > vCsModel.tmp
      sed -i 's/CsModel                        : //g' vCsModel.tmp
      CsModel=$(cat vCsModel.tmp)
      echo  "-,"${CsModel} >> $baseDir/result.txt

      grep -r devicesInformation* -e 'BiosReleaseDate' > vBiosReleaseDate.tmp
      sed -i 's/BiosReleaseDate                : //g' vBiosReleaseDate.tmp
      BiosReleaseDate=$(cat vBiosReleaseDate.tmp)
      echo  "-,"${BiosReleaseDate} >> $baseDir/result.txt

      grep -r devicesInformation* -e 'OsName' > vOsName.tmp
      sed -i 's/OsName                         : //g' vOsName.tmp
      OsName=$(cat vOsName.tmp)
      echo  "-,"${OsName} >> $baseDir/result.txt

      grep -r devicesInformation* -e 'WindowsInstallDateFromRegistry' > vWindowsInstallDateFromRegistry.tmp
      sed -i 's/WindowsInstallDateFromRegistry : //g' vWindowsInstallDateFromRegistry.tmp
      WindowsInstallDateFromRegistry=$(cat vWindowsInstallDateFromRegistry.tmp)
      echo  "-,"${WindowsInstallDateFromRegistry} >> $baseDir/result.txt

      rm -rf *.tmp
      cat $baseDir/result.txt
#      tr -d "\n -" < $baseDir/result.txt >> $baseDir/result.csv
#      rm -rf $baseDir/result.txt
      echo

    done
  else
    echo $d >> $baseDir/resultDouble.txt
  fi
done
