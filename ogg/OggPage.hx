package ogg;

import cpp.Int64;
import cpp.UInt8;

@:keep
@:include('ogg/ogg.h')
@:structAccess
@:native("ogg_page")
extern class OggPage {
    public var header:Array<UInt8>;
    public var header_len:Int64;
    public var body:Array<UInt8>;
    public var body_len:Int64;

    public static inline function init():OggPage {
      return untyped __cpp__("ogg_page{}");  
    }
}


@:keep
@:include('ogg/ogg.h')
@:structAccess
@:native("ogg_packet")
extern class OggPacket {
  public var packet:cpp.RawPointer<UInt8>;
  public var bytes:Int64;
  public var b_o_s:Int64;
  public var e_o_s:Int64;
  public var granulepos:Int64;
  public var packetno:Int64;

  public static inline function init():OggPacket {
    return untyped __cpp__("ogg_packet{}");  
  }
}


@:keep
@:include('ogg/ogg.h')
@:structAccess
@:native("ogg_stream_state")
extern class OggStreamState {
  public var body_data:cpp.RawPointer<UInt8>;
  public var body_storage:Int64;
  public var body_fill:Int64;
  public var body_returned:Int64;
  public var lacing_vals:cpp.RawPointer<Int>;
  public var granule_vals:Int64;
  public var long_storage:Int64;
  public var lacing_fill:Int64;
  public var lacing_packet:Int64;
  public var lacing_returned:Int64;
  public var header:Array<UInt8>;
  public var header_fill:Int;
  public var b_o_s:Int64;
  public var e_o_s:Int64;
  public var serialno:Int64;
  public var pageno:Int64;
  public var packetno:Int64;
  public var granulepos:Int64;
}
