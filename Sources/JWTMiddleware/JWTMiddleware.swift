import Vapor
import JWT

public final class JWTMiddleware<T: JWTPayload>: Middleware {
    
    public init() {}
    
    public func respond(to request: Request, chainingTo next: Responder) -> EventLoopFuture<Response> {
        
        do {
            request.payload = try payload(request)
        } catch {
            return request.eventLoop.makeFailedFuture(error)
        }
        
        return next.respond(to: request)
    }
    
    private func payload(_ request: Request) throws -> T {
        guard let token = request.headers.bearerAuthorization?.token else {
            throw Abort(.unauthorized)
        }
                        
        return try request.jwt.verify(token, as: T.self)
    }
}

private struct JWTPayloadStorageKey: StorageKey {
    typealias Value = JWTPayload
}

public extension Request {
    var payload: JWTPayload? {
        get { storage.get(JWTPayloadStorageKey.self) }
        set { storage.set(JWTPayloadStorageKey.self, to: newValue) }
    }
}
