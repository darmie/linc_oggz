package oggz;

import cpp.Function;
import cpp.Char;
import cpp.UInt8;
import ogg.OggPage;
import cpp.Float64;
import cpp.SizeT;
import cpp.Callable;
import cpp.Int64;
import cpp.FILE;
import cpp.RawPointer;


@:keep
@:native("long")
extern class TLong{}

abstract Long(TLong) from TLong to TLong {
    @:to public inline function toInt64():Int64 {
        return untyped __cpp__("(::cpp::Int64){0}", this);
    }

	@:from public static inline function fromInt(x:Int64):Long{
		return untyped __cpp__("(long){0}", x);
	}

	@:op("A<B") public inline function lt(b:Long):Long {
		return untyped __cpp__("{0} < {1}", this, b);
	}

	@:op("A<B") public inline function lti(b:Int):Long {
		return untyped __cpp__("{0} < {1}", this, b);
	}

	@:op("A<=B") public inline function lte(b:Long):Long {
		return untyped __cpp__("{0} <= {1}", this, b);
	}

	@:op("A<=B") public inline function ltei(b:Int):Long {
		return untyped __cpp__("{0} <= {1}", this, b);
	}

	@:op("A>B") public inline function gt(b:Long):Long {
		return untyped __cpp__("{0} > {1}", this, b);
	}

	@:op("A > B") public inline function gti(b:Int):Long {
		return untyped __cpp__("{0} > {1}", this, b);
	}

	@:op("A >= B") public static inline function gte(a:Long, b:Long):Long {
		return untyped __cpp__("{0} >= {1}", a, b);
	}

	@:op("A>=B") public inline function gtei(b:Int):Long {
		return untyped __cpp__("{0} >= {1}", this, b);
	}
}

@:keep
@:include('linc_oggz.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('oggz'))
#end
@:native("OGGZ")
extern class Oggz {
	@:native("oggz_new")
	public static function init(flags:Int):RawPointer<Oggz>;

	@:native("oggz_open")
	public static function open(filename:String, flags:Int):RawPointer<Oggz>;

	@:native("oggz_open_stdio")
	public static function open_stdio(file:FILE, flags:Int):RawPointer<Oggz>;

	@:native("oggz_flush")
	public static function flush(oggz:RawPointer<Oggz>):Int;

	@:native("oggz_run")
	public static function run(oggz:RawPointer<Oggz>):Int;

	@:native("oggz_run_set_blocksize")
	public static function run_set_blocksize(oggz:RawPointer<Oggz>, block_size:Int64):Int;

	@:native("oggz_close")
	public static function close(oggz:RawPointer<Oggz>):Int;

	@:native("oggz_get_bos")
	public static function get_bos(oggz:RawPointer<Oggz>, serialno:Int64):Int;

	@:native("oggz_get_eos")
	public static function get_eos(oggz:RawPointer<Oggz>, serialno:Int64):Int;

	@:native("oggz_get_numtracks")
	public static function get_numtracks(oggz:RawPointer<Oggz>):Int;

	@:native("oggz_serialno_new")
	public static function serialno_new(oggz:RawPointer<Oggz>):Int64;

	@:native("oggz_content_type")
	public static function content_type(oggz:RawPointer<Oggz>):String;

	// =======//

	/**
	 * COMMENT
	 */
	// =======//
	@:native("oggz_comment_get_vendor")
	public static function comment_get_vendor(oggz:RawPointer<Oggz>, serialno:Int64):String;

	@:native("oggz_comment_set_vendor")
	public static function comment_set_vendor(oggz:RawPointer<Oggz>, serialno:Int64, vendor:String):Int;

	@:native("oggz_comment_first")
	public static function comment_first(oggz:RawPointer<Oggz>, serialno:Int64):RawPointer<Comment>;

	@:native("oggz_comment_next")
	public static function comment_next(oggz:RawPointer<Oggz>, serialno:Int64, comment:RawPointer<Comment>):RawPointer<Comment>;

	@:native("oggz_comment_first_byname")
	public static function comment_first_byname(oggz:RawPointer<Oggz>, serialno:Int64, name:String):RawPointer<Comment>;

	@:native("oggz_comment_next_byname")
	public static function comment_next_byname(oggz:RawPointer<Oggz>, serialno:Int64, comment:RawPointer<Comment>):RawPointer<Comment>;

	@:native("oggz_comment_add")
	public static function comment_add(oggz:RawPointer<Oggz>, serialno:Int64, comment:RawPointer<Comment>):Int;

	@:native("oggz_comment_add_byname")
	public static function comment_add_byname(oggz:RawPointer<Oggz>, serialno:Int64, name:String, value:String):Int;

	@:native("oggz_comment_remove")
	public static function comment_remove(oggz:RawPointer<Oggz>, serialno:Int64, comment:RawPointer<Comment>):Int;

	@:native("oggz_comment_remove_byname")
	public static function comment_remove_byname(oggz:RawPointer<Oggz>, serialno:Int64, name:String):Int;

	@:native("oggz_comments_generate")
	public static function comments_generate(oggz:RawPointer<Oggz>, serialno:Int64, FLAC_final_metadata_block:Int):RawPointer<Packet>;

	@:native("oggz_comments_copy")
	public static function comments_copy(src:RawPointer<Oggz>, src_serialno:Int64, dest:RawPointer<Oggz>, dest_serialno:Int64):RawPointer<Packet>;

	@:native("oggz_packet_destroy")
	public static function packet_destroy(packet:RawPointer<Packet>):Void;

	@:native("oggz_io_set_read") public static function io_set_read(oggz:RawPointer<Oggz>, read:OggzIOReadWrite, user_handle:RawPointer<UInt8>):Int;

	@:native("oggz_io_set_write") public static function io_set_write(oggz:RawPointer<Oggz>, write:OggzIOReadWrite, user_handle:Dynamic):Int;
	@:native("oggz_io_get_read_user_handle") public static function io_get_read_user_handle(oggz:RawPointer<Oggz>):Dynamic;
	@:native("oggz_io_get_write_user_handle") public static function io_get_write_user_handle(oggz:RawPointer<Oggz>):Dynamic;

	@:native("oggz_io_set_seek") public static function io_set_seek(oggz:RawPointer<Oggz>, seek:OggzIOSeek, user_handle:Dynamic):Int;

	@:native("oggz_io_get_seek_user_handle") public static function io_get_seek_user_handle(oggz:RawPointer<Oggz>):Dynamic;

	@:native("oggz_io_set_tell") public static function io_set_tell(oggz:RawPointer<Oggz>, tell:OggzIOTell, user_handle:Dynamic):Int;

	@:native("oggz_io_get_tell_user_handle") public static function io_get_tell_user_handle(oggz:RawPointer<Oggz>):Dynamic;

	@:native("oggz_io_set_flush") public static function io_set_flush(oggz:RawPointer<Oggz>, flush:OggzIOFlush, user_handle:Dynamic):Int;

	@:native("oggz_io_get_flush_user_handle") public static function io_get_flush_user_handle(oggz:RawPointer<Oggz>):Dynamic;

	// ==== //

	/**
	 * IO
	 */
	// === //
	@:native("oggz_set_read_callback")
	public static function set_read_callback(oggz:RawPointer<Oggz>, serialno:Int64, read_packet:OggzReadPacket, user_data:RawPointer<Void>):Int;

	@:native("oggz_set_read_page")
	public static function set_read_page(oggz:RawPointer<Oggz>, serialno:Int64, read_page:OggzReadPage, user_data:RawPointer<Void>):Int;

	@:native("oggz_read")
	public static function read(oggz:RawPointer<Oggz>, n:Int64):Int64;

	@:native("oggz_read_input")
	public static function read_input(oggz:RawPointer<Oggz>, buf:RawPointer<UInt8>, n:Int):Int64;

	@:native("oggz_purge")
	public static function purge(oggz:RawPointer<Oggz>):Int64;

	@:native("oggz_stream_get_content")
	public static function stream_get_content(oggz:RawPointer<Oggz>, serialno:Int64):OggzStreamContent;

	@:native("oggz_stream_get_content_type")
	public static function stream_get_content_type(oggz:RawPointer<Oggz>, serialno:Int64):String;

	@:native("oggz_stream_get_numheaders")
	public static function stream_get_numheaders(oggz:RawPointer<Oggz>, serialno:Int64):Int;

	// ===//

	/**
	 * SEEK
	 */
	// ===//
	@:native("oggz_tell_units")
	public static function tell_units(oggz:RawPointer<Oggz>):Int64;

	@:native("oggz_seek_units")
	public static function seek_units(oggz:RawPointer<Oggz>, units:Int64, whence:Int):Int64;

	@:native("oggz_tell_granulepos")
	public static function tell_granulepos(oggz:RawPointer<Oggz>):Int64;

	@:native("oggz_tell")
	public static function tell(oggz:RawPointer<Oggz>):Float64;

	@:native("oggz_seek")
	public static function seek(oggz:RawPointer<Oggz>, offset:Float64, whence:Int):Int64;

	@:native("oggz_get_preroll")
	public static function get_preroll(oggz:RawPointer<Oggz>, serialno:Int64):Int;

	@:native("oggz_set_preroll")
	public static function set_preroll(oggz:RawPointer<Oggz>, serialno:Int64, preroll:Int):Int;

	@:native("oggz_get_granuleshift")
	public static function get_granuleshift(oggz:RawPointer<Oggz>, serialno:Int64):Int;

	@:native("oggz_set_granuleshift")
	public static function set_granuleshift(oggz:RawPointer<Oggz>, serialno:Int64, granuleshift:Int):Int;

	@:native("oggz_get_granulerate")
	public static function get_granulerate(oggz:RawPointer<Oggz>, serialno:Int64, granulerate_n:RawPointer<Int64>, granulerate_d:RawPointer<Int64>):Int;

	@:native("oggz_set_granulerate")
	public static function set_granulerate(oggz:RawPointer<Oggz>, serialno:Int64, granulerate_n:Int64, granulerate_d:Int64):Int;

	@:native("oggz_set_metric")
	public static function set_metric(oggz:RawPointer<Oggz>, serialno:Int64, metric:OggzMetric, user_data:RawPointer<cpp.Void>):Int;

	@:native("oggz_set_data_start")
	public static function set_data_start(oggz:RawPointer<Oggz>, offset:Float64):Int;

	@:native("oggz_bounded_seek_set")
	public static function bounded_seek_set(oggz:RawPointer<Oggz>, unit_target:Int64, offset_begin:Int64, offset_end:Int64):Int64;
	// ===//
	/**
	 * WRITE
	 */
	// ===//

    @:native("oggz_write_set_hungry_callback")
    public static function write_set_hungry_callback(oggz:RawPointer<Oggz>, writehungry:OggzWriteHungry, only_when_empty:Int, user_data:RawPointer<cpp.Void>):Int;

    @:native("oggz_write_feed")
    public static function write_feed(oggz:RawPointer<Oggz>, op:RawPointer<OggPacket>, serialno:Int64, flush:Int, guard:RawPointer<Int>):Int;

    @:native("oggz_write_output")
    public static function write_output(oggz:RawPointer<Oggz>, buf:RawPointer<UInt8>, n:Int64):Long;

    @:native("oggz_write")
    public static function write(oggz:RawPointer<Oggz>, n:Int):Int64;

    @:native("oggz_write_get_next_page_size")
    public static function write_get_next_page_size(oggz:RawPointer<Oggz>):Int64;
} // Oggz

@:keep
@:include('linc_oggz.h')
@:native('OggzTable')
extern class Table {
	@:native('oggz_table_new')
	public static function init():RawPointer<Table>;

	@:native("oggz_table_delete")
	public static function delete(table:RawPointer<Table>):Void;

	@:native("oggz_table_insert")
	public static function insert(table:RawPointer<Table>, key:Int64, data:RawPointer<Void>):RawPointer<Void>;

	@:native("oggz_table_remove")
	public static function remove(table:RawPointer<Table>, key:Int64):Int;

	@:native("oggz_table_lookup")
	public static function lookup(table:RawPointer<Table>, key:Int64):RawPointer<Void>;

	@:native("oggz_table_size")
	public static function size(table:RawPointer<Table>):Int;

	@:native("oggz_table_nth")
	public static function nth(table:RawPointer<Table>, n:Int, key:Int64):RawPointer<Void>;
}

@:keep
@:include('linc_oggz.h')
@:structAccess
@:native("OggzComment")
extern class Comment {
	public var name:String;
	public var value:String;

	public static inline function init():Comment {
		return untyped __cpp__("OggzComment{}");
	}
}

@:keep
@:include('linc_oggz.h')
@:structAccess
@:native("oggz_packet")
extern class Packet {
	public var op:OggPacket;
	public var pos:Position;

	public static inline function init():Packet {
		return untyped __cpp__("oggz_packet{}");
	}
}

@:keep
@:include('linc_oggz.h')
@:structAccess
@:native("oggz_position")
extern class Position {
	public var calc_granulepos:Int64;
	public var begin_page_offset:Float64;
	public var end_page_offset:Float64;
	public var pages:Int;
	public var begin_segment_index:Int;

	public static inline function init():Position {
		return untyped __cpp__("oggz_positiont{}");
	}
}

enum abstract OggzFlags(Int) from Int to Int {
	/** Read only */
	var OGGZ_READ = 0x00;

	/** Write only */
	var OGGZ_WRITE = 0x01;

	/** Disable strict adherence to mapping constraints, eg for
	 * handling an incomplete stream */
	var OGGZ_NONSTRICT = 0x10;

	/**
	 * Scan for known headers while reading, and automatically set
	 * metrics appropriately. Opening a file for reading with
	 * \a flags = OGGZ_READ | OGGZ_AUTO will allow seeking on Speex,
	 * Vorbis, FLAC, Theora, CMML and all Annodex streams in units of
	 * milliseconds, once all bos pages have been delivered. */
	var OGGZ_AUTO = 0x20;

	/**
	 * Write Prefix: Assume that we are only writing the prefix of an
	 * Ogg stream, ie. disable checking for conformance with end-of-stream
	 * constraints.
	 */
	var OGGZ_PREFIX = 0x40;

	/**
	 * Write Suffix: Assume that we are only writing the suffix of an
	 * Ogg stream, ie. disable checking for conformance with
	 * beginning-of-stream constraints.
	 */
	var OGGZ_SUFFIX = 0x80;
}

enum abstract OggzStopCtl(Int) from Int to Int {
	/** Continue calling read callbacks */
	var OGGZ_CONTINUE     = 0;
  
	/** Stop calling callbacks, but retain buffered packet data */
	var OGGZ_STOP_OK      = 1;
  
	/** Stop calling callbacks, and purge buffered packet data */
	var OGGZ_STOP_ERR     = -1;
}

@:keep
@:include('linc_oggz.h')
@:structAccess
@:native("OggzStreamContent")
extern class TOggzStreamContent {}

extern enum abstract OggzStreamContent(TOggzStreamContent) {
	@:native("OGGZ_CONTENT_THEORA")
	var OGGZ_CONTENT_THEORA;
	@:native("OGGZ_CONTENT_VORBIS")
	var OGGZ_CONTENT_VORBIS;
	@:native("OGGZ_CONTENT_SPEEX")
	var OGGZ_CONTENT_SPEEX;
	@:native("OGGZ_CONTENT_PCM")
	var OGGZ_CONTENT_PCM;
	@:native("OGGZ_CONTENT_CMML")
	var OGGZ_CONTENT_CMML;
	@:native("OGGZ_CONTENT_ANX2")
	var OGGZ_CONTENT_ANX2;
	@:native("OGGZ_CONTENT_SKELETON")
	var OGGZ_CONTENT_SKELETON;
	@:native("OGGZ_CONTENT_FLAC0")
	var OGGZ_CONTENT_FLAC0;
	@:native("OGGZ_CONTENT_FLAC")
	var OGGZ_CONTENT_FLAC;
	@:native("OGGZ_CONTENT_ANXDATA")
	var OGGZ_CONTENT_ANXDATA;
	@:native("OGGZ_CONTENT_CELT")
	var OGGZ_CONTENT_CELT;
	@:native("OGGZ_CONTENT_KATE")
	var OGGZ_CONTENT_KATE;
	@:native("OGGZ_CONTENT_DIRAC")
	var OGGZ_CONTENT_DIRAC;
	@:native("OGGZ_CONTENT_OPUS")
	var OGGZ_CONTENT_OPUS;
	@:native("OGGZ_CONTENT_VP8")
	var OGGZ_CONTENT_VP8;
	@:native("OGGZ_CONTENT_UNKNOWN")
	var OGGZ_CONTENT_UNKNOWN;
}

typedef OggzIOReadWrite = Callable<(user_handle:RawPointer<cpp.Void>, buf:RawPointer<cpp.Void>, n:cpp.SizeT) -> SizeT>;
typedef OggzIOSeek = Callable<(user_handle:RawPointer<cpp.Void>, offset:Int64, whence:Int) -> Int>;
typedef OggzIOTell = Callable<(user_handle:RawPointer<cpp.Void>) -> Int64>;
typedef OggzIOFlush = Callable<(user_handle:RawPointer<cpp.Void>) -> Int>;
typedef OggzReadPacket = Callable<(oggz:RawPointer<Oggz>, packet:RawPointer<Packet>, serialno:Long, user_data:RawPointer<cpp.Void>) -> Int>;
typedef OggzReadPage = Callable<(oggz:RawPointer<Oggz>, page:OggPage, serialno:Int64, user_data:RawPointer<cpp.Void>) -> Int>;
typedef OggzMetric = Callable<(oggz:RawPointer<Oggz>, serialno:Int64, granulepos:Int64, user_data:RawPointer<cpp.Void>) -> Int64>;
typedef OggzWriteHungry = Callable<(oggz:RawPointer<Oggz>, empty:Int, user_data:RawPointer<cpp.Void>) -> Int>;

