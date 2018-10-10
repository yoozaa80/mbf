program uartmethods;
{
  This file is part of Pascal Microcontroller Board Framework (MBF)
  Copyright (c) 2015 -  Michael Ring
  based on Pascal eXtended Library (PXL)
  Copyright (c) 2000 - 2015  Yuriy Kotsarenko

  This program is free software: you can redistribute it and/or modify it under the terms of the FPC modified GNU
  Library General Public License for more

  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the FPC modified GNU Library General Public
  License for more details.
}

{$INCLUDE MBF.Config.inc}

uses
  MBF.__CONTROLLERTYPE__.SystemCore,
  MBF.__CONTROLLERTYPE__.GPIO,
  MBF.__CONTROLLERTYPE__.UART;

var
  aUARTParity : TUARTParity;
  aUARTBitsPerWord : TUARTBitsPerWord;
  aUARTStopBits : TUARTStopBits;
  dummyByte : Byte;
  dummyWord : Word;
  dummyByteArray : array[0..1] of byte;
  dummyWordArray : array[0..1] of word;
  success : boolean;
begin
  // Initialize the Board and the SystemTimer
  SystemCore.Initialize;

  // Initialize the GPIO subsystem
  GPIO.Initialize;

  // Test availability of all interfaces

  aUARTParity :=TUARTParity.Even;
  aUARTParity :=TUARTParity.Odd;
  aUARTParity :=TUARTParity.None;

  aUARTBitsPerWord := TUARTBitsPerWord.Eight;

  aUARTStopBits := TUARTStopBits.One;

  // Initialize the UART subsystem
  UART.Initialize;
  UART.RxPin := TUARTRxPins.D0_UART;
  UART.TxPin := TUARTTxPins.D1_UART;

  UART.Initialize(TUARTRxPins.D0_UART,TUARTTxPins.D1_UART);
  UART.Baudrate := DefaultUARTBaudrate;
  UART.Parity := TUARTParity.None;
  UART.StopBits := TUARTStopBits.One;

  // Read without Timeout
  success := UART.WriteByte(dummyByte);
  success := UART.WriteByte(dummyByteArray);
  
  // Read with Timeout
  success := UART.WriteByte(dummyByte,1000);
  success := UART.WriteByte(dummyByteArray,1000);
  
  // Write without Timeout
  success := UART.WriteByte(dummyByte);
  success := UART.WriteByte(dummyByteArray);
  
  // Write with Timeout
  success := UART.WriteByte(dummyByte,1000);
  success := UART.WriteByte(dummyByteArray,1000);
end.  

