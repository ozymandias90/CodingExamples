TestString = "abcabcdefghiabcdef"

longestString="";
currentString="";

for i in range(len(TestString)):
	print TestString[i], longestString, currentString
	if TestString[i] not in currentString:
		currentString = currentString+TestString[i];
	else:
		if len(currentString) > len(longestString):
			longestString = currentString;
		currentString = currentString[currentString.index(TestString[i])+1:i]+TestString[i];

if len(currentString) > len(longestString):
	longestString = currentString;

print longestString