unit MBF.STM32L4.SPI;
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

interface
{$INCLUDE MBF.Config.inc}

uses
  MBF.STM32L4.GPIO;

{$REGION PinDefinitions}

type
    TSPIMOSIPins = (
    {$if defined(has_SPI2) and defined(has_gpioc) }   PC1_SPI2 = ALT3 or TNativePin.PC1  {$endif}
    {$if defined(has_SPI2) and defined(has_gpioc) },                                     {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa) }   PA7_SPI1 = ALT5 or TNativePin.PA7  {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa) }, PA12_SPI1 = ALT5 or TNativePin.PA12 {$endif}
    {$if defined(has_SPI1) and defined(has_gpiob) },  PB5_SPI1 = ALT5 or TNativePin.PB5  {$endif}
    {$if defined(has_arduinominipins)             },  D11_SPI  = ALT5 or TNativePin.PB5  {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob) }, PB15_SPI2 = ALT5 or TNativePin.PB15 {$endif}
    {$if defined(has_SPI2) and defined(has_gpioc) },  PC3_SPI2 = ALT5 or TNativePin.PC3  {$endif}
    {$if defined(has_SPI2) and defined(has_gpiod) },  PD4_SPI2 = ALT5 or TNativePin.PD4  {$endif}
    {$if defined(has_SPI3) and defined(has_gpiod) },  PD6_SPI3 = ALT5 or TNativePin.PD6  {$endif}
    {$if defined(has_SPI1) and defined(has_gpioe) }, PE15_SPI1 = ALT5 or TNativePin.PE15 {$endif}
    {$if defined(has_SPI1) and defined(has_gpiog) },  PG4_SPI1 = ALT5 or TNativePin.PG4  {$endif}
    {$if defined(has_SPI2) and defined(has_gpioi) },  PI3_SPI2 = ALT5 or TNativePin.PI3  {$endif}
    {$if defined(has_SPI3) and defined(has_gpiob) },  PB5_SPI3 = ALT6 or TNativePin.PB5  {$endif}
    {$if defined(has_SPI3) and defined(has_gpioc) }, PC12_SPI3 = ALT6 or TNativePin.PC12 {$endif}
    {$if defined(has_SPI3) and defined(has_gpiog) }, PG11_SPI3 = ALT6 or TNativePin.PG11 {$endif}
  );

    TSPIMISOPins = (
      {$if defined(has_SPI1) and defined(has_gpioa) }   PA6_SPI1 = ALT5 or TNativePin.PA6  {$endif}
      {$if defined(has_SPI1) and defined(has_gpioa) }, PA11_SPI1 = ALT5 or TNativePin.PA11 {$endif}
      {$if defined(has_SPI1) and defined(has_gpiob) },  PB4_SPI1 = ALT5 or TNativePin.PB4  {$endif}
      {$if defined(has_arduinominipins)             },  D12_SPI  = ALT5 or TNativePin.PB4  {$endif}
      {$if defined(has_SPI2) and defined(has_gpiob) }, PB14_SPI2 = ALT5 or TNativePin.PB14 {$endif}
      {$if defined(has_SPI2) and defined(has_gpioc) },  PC2_SPI2 = ALT5 or TNativePin.PC2  {$endif}
      {$if defined(has_SPI2) and defined(has_gpiod) },  PD3_SPI2 = ALT5 or TNativePin.PD3  {$endif}
      {$if defined(has_SPI1) and defined(has_gpioe) }, PE14_SPI1 = ALT5 or TNativePin.PE14 {$endif}
      {$if defined(has_SPI1) and defined(has_gpiog) },  PG3_SPI1 = ALT5 or TNativePin.PG3  {$endif}
      {$if defined(has_SPI2) and defined(has_gpioi) },  PI2_SPI2 = ALT5 or TNativePin.PI2  {$endif}
      {$if defined(has_SPI3) and defined(has_gpiob) },  PB4_SPI3 = ALT6 or TNativePin.PB4  {$endif}
      {$if defined(has_SPI3) and defined(has_gpioc) }, PC11_SPI3 = ALT6 or TNativePin.PC11 {$endif}
      {$if defined(has_SPI3) and defined(has_gpiog) }, PG10_SPI3 = ALT6 or TNativePin.PG10 {$endif}
    );

    TSPISCLKPins = (
      {$if defined(has_SPI2) and defined(has_gpioa) }   PA9_SPI2 = ALT3 or TNativePin.PA9  {$endif}
      {$if defined(has_SPI2) and defined(has_gpiod) },  PD3_SPI2 = ALT3 or TNativePin.PD3  {$endif}
      {$if defined(has_SPI2) and defined(has_gpiod) },                                     {$endif}
      {$if defined(has_SPI1) and defined(has_gpioa) }   PA1_SPI1 = ALT5 or TNativePin.PA1  {$endif}
      {$if defined(has_SPI1) and defined(has_gpioa) },  PA5_SPI1 = ALT5 or TNativePin.PA5  {$endif}
      {$if defined(has_SPI1) and defined(has_gpiob) },  PB3_SPI1 = ALT5 or TNativePin.PB3  {$endif}
      {$if defined(has_arduinominipins)             },  D13_SPI  = ALT5 or TNativePin.PB3  {$endif}
      {$if defined(has_SPI2) and defined(has_gpiob) }, PB10_SPI2 = ALT5 or TNativePin.PB10 {$endif}
      {$if defined(has_SPI2) and defined(has_gpiob) }, PB13_SPI2 = ALT5 or TNativePin.PB13 {$endif}
      {$if defined(has_SPI2) and defined(has_gpiod) },  PD1_SPI2 = ALT5 or TNativePin.PD1  {$endif}
      {$if defined(has_SPI1) and defined(has_gpioe) }, PE13_SPI1 = ALT5 or TNativePin.PE13 {$endif}
      {$if defined(has_SPI1) and defined(has_gpiog) },  PG2_SPI1 = ALT5 or TNativePin.PG2  {$endif}
      {$if defined(has_SPI2) and defined(has_gpioi) },  PI1_SPI2 = ALT5 or TNativePin.PI1  {$endif}
      {$if defined(has_SPI3) and defined(has_gpiob) },  PB3_SPI3 = ALT6 or TNativePin.PB3  {$endif}
      {$if defined(has_SPI3) and defined(has_gpioc) }, PC10_SPI3 = ALT6 or TNativePin.PC10 {$endif}
      {$if defined(has_SPI3) and defined(has_gpiog) },  PG9_SPI3 = ALT6 or TNativePin.PG9  {$endif}
    );

    TSPINSSPins = (
    {$if defined(has_SPI1) and defined(has_gpioa) }   PA4_SPI1 = ALT5 or TNativePin.PA4  {$endif}
    {$if defined(has_SPI1) and defined(has_gpioa) }, PA15_SPI1 = ALT5 or TNativePin.PA15 {$endif}
    {$if defined(has_SPI1) and defined(has_gpiob) },  PB0_SPI1 = ALT5 or TNativePin.PB0  {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob) },  PB9_SPI2 = ALT5 or TNativePin.PB9  {$endif}
    {$if defined(has_SPI2) and defined(has_gpiob) }, PB12_SPI2 = ALT5 or TNativePin.PB12 {$endif}
    {$if defined(has_SPI2) and defined(has_gpiod) },  PD0_SPI2 = ALT5 or TNativePin.PD0  {$endif}
    {$if defined(has_SPI1) and defined(has_gpioe) }, PE12_SPI1 = ALT5 or TNativePin.PE12 {$endif}
    {$if defined(has_SPI1) and defined(has_gpiog) },  PG5_SPI1 = ALT5 or TNativePin.PG5  {$endif}
    {$if defined(has_SPI2) and defined(has_gpioi) },  PI0_SPI2 = ALT5 or TNativePin.PI0  {$endif}
    {$if defined(has_SPI3) and defined(has_gpioa) },  PA4_SPI3 = ALT6 or TNativePin.PA4  {$endif}
    {$if defined(has_SPI3) and defined(has_gpioa) }, PA15_SPI3 = ALT6 or TNativePin.PA15 {$endif}
    {$if defined(has_SPI3) and defined(has_gpiog) }, PG12_SPI3 = ALT6 or TNativePin.PG12 {$endif}
    {$if defined(has_arduinominipins)             },  D10_SPI  =         TNativePin.PA11 {$endif}
  );
{$ENDREGION}

const
  DefaultSPIFrequency=8000000;

type
  TSPIMode = (
    Mode0=%00,
    Mode1=%01,
    Mode2=%10,
    Mode3=%11
  );

  TSPIBitsPerWord = (
    Eight=0,
    Sixteen=1
  );

    TSPIRegistersHelper = record helper for TSPI_Registers
  protected
    function FindDividerValue(const Baudrate: Cardinal) : Cardinal;
    function GetFrequency: Cardinal;
    procedure SetFrequency(const Value: Cardinal);
    function GetBitsPerWord: TSPIBitsPerWord;
    procedure SetBitsPerWord(const Value: TSPIBitsPerWord);
    function GetMode: TSPIMode;
    procedure SetMode(const Value: TSPIMode);
    //function GetNssMode: TSPINssMode;
    //procedure SetNssMode(const Value : TSPINssMode);
    procedure SetMOSIPin(const Value : TSPIMOSIPins);
    procedure SetMISOPin(const Value : TSPIMISOPins);
    procedure SetSCLKPin(const Value : TSPISCLKPins);
    procedure SetNSSPin( const Value : TSPINSSPins);
  public
    procedure Initialize;
    procedure Initialize(const AMosiPin : TSPIMOSIPins;
                         const AMisoPin : TSPIMISOPins;
                         const ASCLKPin : TSPISCLKPins;
                         const ANSSPin  : TSPINSSPins); overload;

    { Reads specified number of bytes to buffer and returns actual number of bytes read. }
    function Read(const Buffer: Pointer; const BufferSize: Cardinal;
                  const SoftNSSPin : TPinIdentifier = TNativePin.None): Cardinal;

    { Writes specified number of bytes from buffer and returns actual number of bytes written. }
    function Write(const Buffer: Pointer; const BufferSize: Cardinal;
                   const SoftNSSPin : TPinIdentifier = TNativePin.None): Cardinal;

    { Transfers data through SPI port asynchronously - that is, reading and writing at the same time.
      @param(ReadBuffer Pointer to data buffer where the data will be read from. If this parameter is set to @nil,
        then no reading will be done.)
      @param(WriteBuffer Pointer to data buffer where the data will be written to. If this parameter is set to @nil,
        then no writing will be done.)
      @param(BufferSize The size of read and write buffers in bytes.)
      @param(optional GPIO Pin that is configured as an Output. This allows the use of Soft-SPI when Hardware SPI is not suitable)
      @returns(Number of bytes that were actually transferred.) }
    function Transfer(const ReadBuffer, WriteBuffer: Pointer; const BufferSize: Cardinal;
                      const SoftNSSPin : TPinIdentifier = TNativePin.None): Cardinal;

    { Transfers data through SPI port asynchronously - that is, reading and writing at the same time.
      @param(Buffer Pointer to data buffer where the data will be read from and at the same time written to,
        overwriting its contents.)
      @param(BufferSize The size of buffer in bytes.)
      @returns(Number of bytes that were actually transferred.) }
    function Transfer(const Buffer: Pointer; const BufferSize: Cardinal;
                      const SoftNSSPin : TPinIdentifier = TNativePin.None): Cardinal;

    { Transfers data through SPI port asynchronously - that is, reading and writing at the same time.
      @param(Value  Word sized Data Value that weill get sent over SPI When in 8 Bit Mode then 2 bytes will be transfered)
      @param(optional GPIO Pin that is configured as an Output. This allows the use of Soft-SPI when Hardware SPI is not suitable)
      @returns(Word Data that was received. When in 8 Bit Mode then 2 bytes will be combined in 1 word) }
    function TransferWord(const Value : word; const SoftNSSPin : TPinIdentifier = TNativePin.None): word;

    //property NssMode : TSPINssMode  read GetNssMode write SetNssMode;
    property MOSIPin : TSPIMOSIPins write setMOSIPin;
    property MISOPin : TSPIMISOPins write setMISOPin;
    property SCLKPin : TSPISCLKPins write setSCLKPin;
    property NSSPin  : TSPINSSPins  write setNSSPin;
    property Frequency : Cardinal read getFrequency write setFrequency;
    property Mode : TSPIMode read getMode write setMode;
    property BitsPerWord : TSPIBitsPerWord read getBitsPerWord write setBitsPerWord;
  end;

  {$IF DEFINED(HAS_ARDUINOPINS)}
  var
    SPI : TSPI_Registers absolute SPI1_BASE;
  {$ENDIF HAS ARDUINOPINS}

  {$IF DEFINED(HAS_ARDUINOMINIPINS)}
  var
    SPI : TSPI_Registers absolute SPI1_BASE;
  {$ENDIF HAS ARDUINOMINIPINS}

implementation
uses
  MBF.STM32L4.SystemCore;

var
  NSSPins : array[1..4] of longInt;

procedure TSPIRegistersHelper.Initialize;
var
  i,CR1,Divider : longWord;
begin
  case longWord(@Self) of
    {$ifdef has_spi1}SPI1_BASE : RCC.APB2ENR  := RCC.APB2ENR or (1 shl 12);{$endif}
    {$ifdef has_spi2}SPI2_BASE : RCC.APB1ENR1 := RCC.APB1ENR1 or (1 shl 14);{$endif}
    {$ifdef has_spi3}SPI3_BASE : RCC.APB1ENR1 := RCC.APB1ENR1 or (1 shl 15);{$endif}
  end;

  for i := 1 to 4 do
    NSSPins[i] := -1;
  // Set Defaults, all crazy Modes turned off, SPI disabled
  self.CR1:= 0;

  // Set Defaults, Auto Bitrate off, 1 Stopbit
  self.CR2:= 0;

  CR1 := 0;

  //BIDIMODE = 0
  //BIDIOE = 0
  //CRCEN = 0
  //CRCNEXT = 0

  //DFF Switch between 8/16 Bits Mode
  //if FBitsPerWord = TSPIBitsPerWordEx.Sixteen then
  //  CR1 := CR1 or (1 shl 11);

  //RXONLY = 0

  //SSM
  //if FNssMode = TSPINssMode.Software then
  CR1 := CR1 or (1 shl 9);

  //SSI
  //if FNssMode = TSPINssMode.Software then
  CR1 := CR1 or (1 shl 8);

  //LSBFIRST = 0
  //SPE = 0 (Enable SPI later)

  //BR Set SPI Frequency
  divider := FindDividerValue(DefaultSPIFrequency);
  CR1 := CR1 or (Divider shl 3);

  // MSTR Always set Master Mode
  CR1 := CR1 or (1 shl 2);

  // Set correct Polarity and Phase aka as Mode 0-3
  CR1 := CR1 or longWord(TSPIMode.Mode0);

  self.CR1 := CR1;

  //if FNssMode = TSPINssMode.Software then
  //self.CR2 := (1 shl 2);

  //Disable I2S Mode
  //self.I2SCFGR := 0;

  //if FNssMode = TSPINssMode.Software then
  //  FGPIO.PinValue[FNSSPin] := 1;
end;

procedure TSPIRegistersHelper.Initialize(const AMosiPin : TSPIMOSIPins;
                     const AMisoPin : TSPIMISOPins;
                     const ASCLKPin : TSPISCLKPins;
                     const ANSSPin  : TSPINSSPins); overload;
begin
  Initialize;

  //Set configuration as defined by user

  GPIO.PinMode[longWord(AMOSIPin) and $ff] := TPinMode((LongWord(AMOSIPin) shr 8) and $0f);
  GPIO.PinMode[longWord(AMISOPin) and $ff] := TPinMode((LongWord(AMISOPin) shr 8) and $0f);
  GPIO.PinMode[longWord(ASCLKPin) and $ff] := TPinMode((LongWord(ASCLKPin) shr 8) and $0f);
  // Some special handling needed
  setNSSPin(ANSSPin);
end;

function TSPIRegistersHelper.FindDividerValue(const Baudrate: Cardinal): Cardinal;
var
  BaseFrequency : Cardinal;
begin
    case longWord(@Self) of
    {$ifdef has_spi1}SPI1_BASE : BaseFrequency := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
    {$ifdef has_spi2}SPI2_BASE : BaseFrequency := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
    {$ifdef has_spi3}SPI3_BASE : BaseFrequency := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
    {$ifdef has_spi4}SPI4_BASE : BaseFrequency := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
  end;

  for result := 0 to 7 do
    if BaudRate >= (BaseFrequency div word(2 shl result)) then
      break;
end;

function TSPIRegistersHelper.GetFrequency: Cardinal;
var
  BaseFrequency : Cardinal;
begin
  case longWord(@Self) of
      {$ifdef has_spi1}SPI1_BASE : BaseFrequency := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
      {$ifdef has_spi2}SPI2_BASE : BaseFrequency := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
      {$ifdef has_spi3}SPI3_BASE : BaseFrequency := SystemCore.GetAPB1PeripheralClockFrequency;{$endif}
      {$ifdef has_spi4}SPI4_BASE : BaseFrequency := SystemCore.GetAPB2PeripheralClockFrequency;{$endif}
  end;
  Result := BaseFrequency shr (((Self.CR1 shr 3) and %111)+1);
end;

procedure TSPIRegistersHelper.SetFrequency(const Value: Cardinal);
var
  Divider : longWord;
begin
    Divider := FindDividerValue(Value);
    Self.CR1 := Self.CR1 and (not (%111 shl 3)) or (Divider shl 3);
end;

function TSPIRegistersHelper.GetBitsPerWord: TSPIBitsPerWord;
begin
  Result := TSPIBitsPerWord((Self.CR1 shr 11) and %1);
end;

procedure TSPIRegistersHelper.SetBitsPerWord(const Value: TSPIBitsPerWord);
begin
  Self.CR1 := Self.CR1 and (not (1 shl 11)) or (longWord(Value) shl 11);
end;

function TSPIRegistersHelper.GetMode: TSPIMode;
begin
  Result := TSPIMode(Self.CR1 and %11);
end;

procedure TSPIRegistersHelper.SetMode(const Value: TSPIMode);
begin
  Self.CR1 := Self.CR1 and (not (%11 shl 0)) or longWord(Value);
end;

function TSPIRegistersHelper.TransferWord(const Value : Word;
                  const SoftNSSPin : TPinIdentifier = TNativePin.None): word;
var
  tmpPin,_NSSPin : TPinIdentifier;
  CR1 : longWord;
begin
  // This is a hack that is only necessary because on Nucleo boards the Pin D10 is not mapped to Hardware-NSS Pin
  _NSSPin := SoftNSSPin;
  if _NSSPin = TNativePin.None then
  begin
    case longWord(@Self) of
      {$ifdef has_spi1}SPI1_BASE : _NSSPin := NSSPins[1];{$endif}
      {$ifdef has_spi2}SPI2_BASE : _NSSPin := NSSPins[2];{$endif}
      {$ifdef has_spi3}SPI3_BASE : _NSSPin := NSSPins[3];{$endif}
      {$ifdef has_spi4}SPI4_BASE : _NSSPin := NSSPins[4];{$endif}
    end;
  end;

  //Take the NSS Pin Low in software Mode (start transfer)
  if _NSSPin < ALT0 then
  begin
    if _NSSPin > TNativePin.None then
      GPIO.PinValue[_NSSPin] := 0;
    // Switch to Software Mode
    self.CR1 := self.CR1 or (1 shl 9) or (1 shl 8);
  end
  else
    //Disable Software Mode
    self.CR1 := self.CR1 and (not (1 shl 8));


  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  self.CR1 := self.CR1 or (1 shl 6);

  //wait for TXE to go high (no more data to shift out)
  while self.SR and (1 shl 1) = 0 do
    ;

  //read data from rx buffer if available and discard it
  if self.SR and (1 shl 0) = 1 then
    Result := self.DR;

  //Put Data into Send Register
  self.DR := Value;

  // RXNE Wait until data is completely shifted in
  while self.SR and (1 shl 0) = 0 do
    ;

  // TXE Wait until data is completely shifted in
  while self.SR and (1 shl 1) = 0 do
    ;

  // TXE Wait until data is completely shifted in
  while self.SR and (1 shl 7) <> 0 do
    ;

  // Now read the result back from Data Register
  Result := self.DR;

  // Take NSS High again in Software Mode (end of Transfer)
  if _NSSPin < ALT0 then
    if (_NSSPin > TNativePin.None) and (_NSSPin < ALT0) then
      GPIO.PinValue[_NSSPin] := 0;

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  self.CR1 := self.CR1 and (not (1 shl 6));
end;

function TSPIRegistersHelper.Transfer(const ReadBuffer, WriteBuffer: Pointer; const BufferSize: Cardinal;
                  const SoftNSSPin : TPinIdentifier = TNativePin.None): Cardinal;
var
  ReadBytes,WriteBytes : cardinal;
  tmpPin, _NSSPin : TPinIdentifier;
begin
  ReadBytes := 0;
  WriteBytes := 0;

  // This is a hack that is only necessary because on Nucleo boards the Pin D10 is not mapped to Hardware-NSS Pin
  _NSSPin := SoftNSSPin;

  if _NSSPin = TNativePin.None then
  begin
    case longWord(@Self) of
      {$ifdef has_spi1}SPI1_BASE : _NSSPin := NSSPins[1];{$endif}
      {$ifdef has_spi2}SPI2_BASE : _NSSPin := NSSPins[2];{$endif}
      {$ifdef has_spi3}SPI3_BASE : _NSSPin := NSSPins[3];{$endif}
      {$ifdef has_spi4}SPI4_BASE : _NSSPin := NSSPins[4];{$endif}
    end;
  end;

  //Take the NSS Pin Low in software Mode (start transfer)
  if _NSSPin < ALT0 then
    // Switch to Software Mode as either no pin is selected or a GPIO Pin
    self.CR1 := self.CR1 or (1 shl 9) or (1 shl 8)
  else
    //Disable Software Mode
    self.CR1 := self.CR1 and (not (1 shl 8));

  // Enable SPI, this also sets NSS Pin Low in Hardware Mode
  self.CR1 := self.CR1 or (1 shl 6);

  //wait for TXE to go high (no more data to shift out)
  while self.SR and (1 shl 1) = 0 do
    ;

  //read data from rx buffer if available and discard it
  if self.SR and (1 shl 0) = 1 then
    Result := self.DR;

  while ((ReadBuffer <> nil) and (ReadBytes < BufferSize)) or ((WriteBuffer <> nil) and (WriteBytes < BufferSize)) do
  begin
    if (_NSSPin > TNativePin.None) and (_NSSPin < ALT0) then
      GPIO.PinValue[_NSSPin] := 0;
    if WriteBuffer <> nil then
    begin
      if getBitsPerWord = TSPIBitsPerWord.Sixteen then
      begin
        self.DR := PWord(PByte(WriteBuffer) + WriteBytes)^;
        Inc(WriteBytes);
        Inc(WriteBytes);
      end
      else
      begin
        self.DR := PByte(PByte(WriteBuffer) + WriteBytes)^;
        Inc(WriteBytes);
      end;
    end
    else
      self.DR := $ff; //We need to send dummy data to be able to receive

    // RXNE Wait until data is completely shifted in
    while self.SR and (1 shl 0) = 0 do
      ;

    // TXE Wait until data is completely shifted in
    while self.SR and (1 shl 1) = 0 do
      ;

    // TXE Wait until data is completely shifted in
    while self.SR and (1 shl 7) <> 0 do
      ;

    Result := self.DR;

    if ReadBuffer <> nil then
    begin // Get data from Read FIFOs.
      if (ReadBytes < BufferSize) and ((ReadBuffer <> WriteBuffer) or (ReadBytes < WriteBytes)) then
      begin
        if getBitsPerWord = TSPIBitsPerWord.Sixteen then
        begin
          PWord(PByte(ReadBuffer) + ReadBytes)^ := result;
          Inc(WriteBytes);
          Inc(WriteBytes);
        end
        else
        begin
          PByte(PByte(ReadBuffer) + ReadBytes)^ := result;
          Inc(ReadBytes);
        end;
      end;
    end;

    if (_NSSPin > TNativePin.None) and (_NSSPin < ALT0) then
      GPIO.PinValue[_NSSPin] := 1;
  end;

  // Disable SPI, this also sets NSS Pin High in Hardware Mode
  self.CR1 := self.CR1 and (not (1 shl 6));
  if WriteBytes > ReadBytes then
    Result := WriteBytes
  else
    Result := ReadBytes;
end;

procedure TSPIRegistersHelper.SetMOSIPin(const value : TSPIMOSIPins);
begin
  GPIO.PinMode[longWord(value) and $ff] := TPinMode((longWord(value) shr 8) and $0f);
end;

procedure TSPIRegistersHelper.setMISOPin(const value : TSPIMISOPins);
begin
  GPIO.PinMode[longWord(value) and $ff] := TPinMode((longWord(value) shr 8) and $0f);
end;

procedure TSPIRegistersHelper.setSCLKPin(const value : TSPISCLKPins);
begin
  GPIO.PinMode[longWord(value) and $ff] := TPinMode((longWord(value) shr 8) and $0f);
end;

procedure TSPIRegistersHelper.setNSSPin(const value : TSPINSSPins);
begin
  if longInt(Value) >=ALT0 then
    GPIO.PinMode[longWord(value) and $ff] := TPinMode((longWord(value) shr 8) and $0f)
  else
    if longInt(Value) >= 0 then
      GPIO.PinMode[longWord(value)] := TPinMode.Output;

  case longWord(@Self) of
      {$ifdef has_spi1}SPI1_BASE : NSSPins[1] := longInt(value);{$endif}
      {$ifdef has_spi2}SPI2_BASE : NSSPins[2] := longInt(value);{$endif}
      {$ifdef has_spi3}SPI3_BASE : NSSPins[3] := longInt(value);{$endif}
      {$ifdef has_spi4}SPI4_BASE : NSSPins[4] := longInt(value);{$endif}
  end;
end;

function TSPIRegistersHelper.Read(const Buffer: Pointer; const BufferSize: Cardinal;
                                  const SoftNSSPin : TPinIdentifier = TNativePin.None): Cardinal;
begin
  Result := Transfer(Buffer, nil, BufferSize, SoftNSSPin);
end;

function TSPIRegistersHelper.Write(const Buffer: Pointer; const BufferSize: Cardinal;
                                   const SoftNSSPin : TPinIdentifier = TNativePin.None): Cardinal;
begin
  Result := Transfer(nil, Buffer, BufferSize, SoftNSSPin);
end;

function TSPIRegistersHelper.Transfer(const Buffer: Pointer; const BufferSize: Cardinal;
                                      const SoftNSSPin : TPinIdentifier = TNativePin.None): Cardinal;
begin
  Result := Transfer(Buffer, Buffer, BufferSize, SoftNSSPin);
end;

end.

