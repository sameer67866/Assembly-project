.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD
.data	
	array dword  1,2,3,4,5,6,7,8,9,10
	arrayLen dword 10
	oddCount dword 0

.code
main PROC
	mov ecx, arrayLen
	mov esi,0

countLoop:
	mov eax,[array + esi]
	test eax,1
	jz incrementCounter
	inc esi	
	loop countLoop
	jmp addResult
incrementCounter:
	inc oddCount
	inc esi
	loop countLoop
addResult:
	mov eax,oddCount
	
	INVOKE ExitProcess, 0
main ENDP
END main
